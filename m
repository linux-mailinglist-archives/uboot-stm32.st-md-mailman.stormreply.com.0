Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E85656B08A5
	for <lists+uboot-stm32@lfdr.de>; Wed,  8 Mar 2023 14:28:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B2E08C6907C;
	Wed,  8 Mar 2023 13:28:38 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 54CFFC6907B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Mar 2023 13:28:37 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 328AdNVJ004500; Wed, 8 Mar 2023 14:28:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=DaC2AyU8eTDRsNnd8dGJAzL4La1oBET4qQlQd6pJnFA=;
 b=zYMq2s8fNy0xHlHhTgrXaZ122SOZyaWc4/rkJeesZhfOEn8TGrD4T2SudYn4heoJJAzU
 PWQbSV7YSOtzxi1IgYbkiFU0IpS4jd7Gp322XhBaSbi+6xu0CHyst15tusIpBchr0Qx6
 Y+I7WuiNGez78GPiaxQdklE53K4u/cf/BJ8SpEqHNxsmFX5cO9BXMTEkfEORhNJm1RKF
 vW+FldWAQF3Oq6q8bJO9dvCc1AXuHP1Uo/A/+NQd/8FEUZ4c3jauG8NEKh1t7zh/s2zX
 jfOK0iOKdsPuKmmrTXjNm7Rpv7zGMKYjAU4OELwnY7MsfMWYxf8foaB7vV4bZBKvEVqz fw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3p6fg14c47-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Mar 2023 14:28:35 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B4D1A100038;
 Wed,  8 Mar 2023 14:26:53 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A3D7B2171C3;
 Wed,  8 Mar 2023 14:26:53 +0100 (CET)
Received: from localhost (10.48.0.157) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Wed, 8 Mar
 2023 14:26:50 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 8 Mar 2023 14:26:46 +0100
Message-ID: <20230308132649.355398-1-patrick.delaunay@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.48.0.157]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-08_08,2023-03-08_03,2023-02-09_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>
Subject: [Uboot-stm32] [PATCH 0/2] efi: remove error in
	efi_disk_probe/efi_disk_remove
X-BeenThere: uboot-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <uboot-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/uboot-stm32/>
List-Post: <mailto:uboot-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


Proposed serie after investigate crash:
- board stm32mp157c-dk2, including a USB HUB 4 ports
- 2 USB key on the USB HUB (same PID/VID)
- multiple command usb start/usb stop

Without these patches, U-Boot failed to probe / failed to unbind the 2nd
key and crash in USB stack, usb_find_usb2_hub_address_port()

When the probe for USB child failed, the unbind failed also.
For example when PSCI stack can't handle 2 devices with the same EFI
handle based on PIDVID for USB device.

On the "usb stop" command, the USB tree becomes invalid as the EFI
stack forbids to remove the USB devices, the USB are still present
(checked with "dm tree" command).

On the next USB start, on USB scan, when the USB devices children of
USB HUB are added dynamically, the USB stack crashes...

I propose to remove the return error in efi_disk_probe/efi_disk_remove
and to replace them by log_error
=> even if EFI can't export the devices, the device should be
   available for U-Boot proper and the probe should be complete properly
   (the 2nd USB keys are see in dm tree in the example)

Sequence to reproduce the issue with 2 identical USB key

STM32MP> usb start && usb tree && usb stop && usb start && usb tree
         && usb stop && usb start && usb tree && usb stop

starting USB...
Bus usb@5800d000: USB EHCI 1.00
scanning bus usb@5800d000 for devices...
Adding disk for usb_mass_storage.lun0 failed (err=-2147483628/0x80000014)
device 'usb_mass_storage.lun0' failed to unbind
3 USB Device(s) found
device 'usb_mass_storage.lun0' failed to unbind
       scanning usb for storage devices... 2 Storage Device(s) found
USB device tree:
  1  Hub (480 Mb/s, 0mA)
  |  u-boot EHCI Host Controller
  |
  +-2  Hub (480 Mb/s, 2mA)
    |
    +-3  Mass Storage (480 Mb/s, 200mA)
    |    Generic Mass Storage 81ED9AA7
    |
stopping USB..
device 'usb_mass_storage.lun0' failed to unbind
device 'usb_mass_storage' failed to unbind
device 'usb_hub' failed to unbind
starting USB...
Bus usb@5800d000: USB EHCI 1.00
scanning bus usb@5800d000 for devices...
Adding disk for usb_mass_storage.lun0 failed (err=-2147483628/0x80000014)
device 'usb_mass_storage.lun0' failed to unbind
3 USB Device(s) found
device 'usb_mass_storage.lun0' failed to unbind
       scanning usb for storage devices... 2 Storage Device(s) found
USB device tree:
  1  Hub (480 Mb/s, 0mA)
  |  u-boot EHCI Host Controller
  |
  +-2  Hub (480 Mb/s, 2mA)
    |
    +-3  Mass Storage (480 Mb/s, 200mA)
    |    Generic Mass Storage 81ED9AA7
    |
stopping USB..
starting USB...
Bus usb@5800d000: scanning bus usb@5800d000 for devices... data abort
pc : [<ddb3e7b6>]	   lr : [<ddb3e7b7>]
reloc pc : [<c01227b6>]	   lr : [<c01227b7>]
sp : dbafa708  ip : dbb54cc0	 fp : dbafa780
r10: dbafac40  r9 : dbb19e80	 r8 : 00000000
r7 : dbafa727  r6 : dbafa726	 r5 : dbb40fc0  r4 : dbafac40
r3 : 00000001  r2 : dbafa726	 r1 : dbafa727  r0 : 00000000
Flags: nZCv  IRQs off  FIQs off  Mode SVC_32 (T)
Code: 592c 4628 f008 ff1d (6843) 2b03
Resetting CPU ...

After the 2 patches, with the 2 SAME keys on the USB HUB
the EFI handle is not created, with error in trace,
BUT the USB key is available in U-Boot proper.

STM32MP> usb start && usb tree && usb stop
starting USB...
Bus usb@5800d000: USB EHCI 1.00
scanning bus usb@5800d000 for devices...
Adding disk for usb_mass_storage.lun0 failed (err=-2147483628/0x80000014)
efi_disk_create_raw usb_mass_storage.lun0 failed (-2)
4 USB Device(s) found
       scanning usb for storage devices... 2 Storage Device(s) found
USB device tree:
  1  Hub (480 Mb/s, 0mA)
  |  u-boot EHCI Host Controller
  |
  +-2  Hub (480 Mb/s, 2mA)
    |
    +-3  Mass Storage (480 Mb/s, 200mA)
    |    Generic Mass Storage 81ED9AA7
    |
    +-4  Mass Storage (480 Mb/s, 200mA)
         Generic Mass Storage C3EAEAD2

stopping USB..
efi_disk_remove failed for usb_mass_storage.lun0 uclass 22 (-1)
efi_disk_remove failed for usb_mass_storage.lun0:1 uclass 73 (-1)


Patrick Delaunay (2):
  efi: remove error in efi_disk_probe
  efi: remove error in efi_disk_remove

 lib/efi_loader/efi_disk.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
