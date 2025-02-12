import UIKit

class SettingsAutoExportHelper {
    func tableView(_ tableView: UITableView, cellForRow: Int) -> UITableViewCell {
        let identifier = "SettingsCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier) ?? UITableViewCell.init(style: .subtitle, reuseIdentifier: identifier)
        cell.separatorInset = UIEdgeInsets.init(top: 0, left: 15.0, bottom: 0, right: 0)

        switch cellForRow {
        case 0:
            cell.textLabel?.text = "Enable Auto Export"
            let autoExportSwitch = UISwitch()
            autoExportSwitch.isOn = UserDefaults.standard.bool(forKey: "autoExportEnabled")
            autoExportSwitch.addTarget(self, action: #selector(toggleAutoExport(_:)), for: .valueChanged)
            cell.accessoryView = autoExportSwitch
        default:
            cell.textLabel?.text = "Undefined"
        }

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRow: Int, viewController: SettingsViewController) {
        switch didSelectRow {
        case 0:
            // No action needed for switch cell
            break
        default: // No op
            break
        }
    }

    @objc func toggleAutoExport(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: "autoExportEnabled")
    }
}
