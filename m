Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F10109A73
	for <lists+uboot-stm32@lfdr.de>; Tue, 26 Nov 2019 09:49:20 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5C333C36B0E
	for <lists+uboot-stm32@lfdr.de>; Tue, 26 Nov 2019 08:49:20 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8E063C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Nov 2019 08:49:19 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAQ8lIWW030996; Tue, 26 Nov 2019 09:49:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=tyNyLfTiCJBIoU2b/HfU1sJ+yU6Zt7JK2JawGv6n4D4=;
 b=x8RJB1gv3z4QiXy6YDW+D63gnAdXqkKXdxI8XsVBRWZfqhZ+aawYg41Gnx67+I4DoTvm
 UIzSmM2CPDTxDyhcq6z1dvYLlBklUtm7kGf4GlO1Ucrg14AQYDBoHPJde1UusutdqyUL
 9Em4QpLvDX7PMlhtTAIZG0GSqpdqv15T0YRjpb5dQtIFTi3fGVwDD/xqza3otqD1XlvJ
 xcCP5NMZicrqSDN/EsHomQQJoJW7t+AC8v/aUTufX0PNzSj/rXDdjXL+2/kIOKZSWVLq
 NRr5Xn9L2qbjv4o6aVnTzIwuZy3mNoXg+5cPoKjr1trw34aV96wTADYXabR4YZnrpOi2 Ig== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2wets9p7up-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Nov 2019 09:49:14 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2D66C10002A;
 Tue, 26 Nov 2019 09:49:14 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1947F2ACE57;
 Tue, 26 Nov 2019 09:49:14 +0100 (CET)
Received: from localhost (10.75.127.50) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 26 Nov 2019 09:49:13 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 26 Nov 2019 09:48:57 +0100
Message-ID: <20191126084911.19761-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-26_01:2019-11-21,2019-11-26 signatures=0
Cc: Bin Meng <bmeng.cn@gmail.com>, Simon Glass <sjg@chromium.org>,
 Alex Marginean <alexandru.marginean@nxp.com>, Lukasz Majewski <lukma@denx.de>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Jean-Jacques Hiblot <jjhiblot@ti.com>, Heiko Schocher <hs@denx.de>,
 Adam Ford <aford173@gmail.com>
Subject: [Uboot-stm32] [PATCH v2 00/14] dm: add support of new binding in
	gpio and pincontrol
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


Hi,

I create this patchset to prepare alignment of stm32mp157c-ev1
device-tree with the linux kernel v5.4.

One node for touch screen support use the IRQ line configuration
using the new kernel binding introduced by the linux kernel
commit ede033e1e863c from v5.1 ('dt-bindings:
gpio: document the new pull-up/pull-down flags')
https://github.com/torvalds/linux/commit/ede033e1e863c

gt9147: goodix_ts@5d {
	compatible = "goodix,gt9147";
	reg = <0x5d>;
	status = "okay";
	irq-gpios = <&stmfx_pinctrl 14
			(GPIO_ACTIVE_HIGH | GPIO_PULL_DOWN)>;
	irq-flags = <IRQ_TYPE_EDGE_RISING>;
};

In Linux Kernel, the GPIO configuration (pull down/up) are now
managed by GPIO lib but they are not yet supported by U-boot in
uclass GPIO or pincontrol (when used by gpio-hog).

This serie adds the support of theses new defines (with ops
get_config/set_config) added in kernel GPIO binding and adds
the test in sandbox.

NB: In a second phase, the removed set_open_drain/get_open_drain
    API could be replaced by the new ops get_config/set_config.

I also align the gpio binding file with the version from the
latest kernel v5.3 (I don't think I remove any U-Boot specific
part with this patch)
I move the added information on gpio hog code in a new file
doc/README.gpio.

To have functional test, I convert pinctrl-generic to
livetree otherwise the pins are not correctly configured in
sandbox, when CONFIG_OF_LIVE is activated.

For the test on gpio I add information for pin configuration in
output of the command "pinmux status" with a simple pincontrol
driver associated to GPIO driver.

NB: after rebase on master branch, the sandbox test "ut dm power_domain"
   is failing; it was not the case for v2019.10.

=>  ut dm power_domain
Test: dm_test_power_domain: power-domain.c
../test/dm/test-main.c:73, dm_test_destroy(): 0 == uclass_destroy(uc): Expected 0, got -22
../test/dm/test-main.c:108, dm_do_test(): 0 == dm_test_destroy(uts): Expected 0, got 1
../test/dm/test-main.c:170, dm_test_main(): 0 == dm_do_test(uts, test, 1): Expected 0, got 1

I think it is linked to commit 52edfed65de9 ("dm: core:
device: switch off power domain after device removal")

After some investigation :

1/ pincontrol is remove in uclass_destroy(0)

2/ power domain is removed in uclass_destroy(0)

3/ device_chld_unbind()
dev_power_domain_off
-> probe power domain (again)
--> pinctrl_select_state() in device_probe()
---> pincontrol is probed (again)

4/ at the end of  dev_power_domain_off() function the power domain
   is unbind in dev_power_domain_off
   device_remove(pd.dev, DM_REMOVE_NORMAL);

So power domain driver is correctly removed but it is not the
case for the pincontrol driver and that cause the issue.

The problem occurs after my serie only because I introduce
a second pincontrol driver for sandbox, so the dynamic changes
but my serie is not the root cause of the issue,
it should be investigated by power domain users.

Workaround to allow test execution:
  "dm: core: device: don't probe pinctrl for power domain"

My working branch:
https://github.com/patrickdelaunay/u-boot/tree/dm

CI-Travis build:
https://travis-ci.org/patrickdelaunay/u-boot/builds/616716294

Issue for tbs2910 board not reproduced locally with buildman
+u-boot.imx exceeds file size limit:
1405+  limit:  0x5fc00 bytes
1406+  actual: 0x60c00 bytes
1407+  excess: 0x1000 bytes

Regards

Patrick Delaunay


Changes in v2:
- use the dev_ API instead of ofnode_ function.
- Identify property with a new struct ofprop as proposed
  by Simon Glass
- Add dev_ iterate functions
- Change dev_ functions in pinctrl-generic
- remove the unused GPIOD_REQUESTED
- remove the open_drain API and ops
- add gpio descriptor initialization helper
- change the proposed ops for pin config to set_dir_flags/get_dir_flags
- reused the existing API dm_gpio_set_dir_flags/dm_gpio_set_dir
- add a new API dm_gpio_get_dir_flags
- simplify sandbox GPIO driver: save dir_flags (GPIOD_...)
  and remove internal flags (GPIOF_...); the previous path
  "gpio: sandbox: cleanup flag support" is no more needed
- add unitary test in dm_test_gpio for set_dir_flags
- add some function check in dm_test_gpio_phandles
- dm_test_gpio_pin_config change to dm_test_gpio_get_dir_flags
- Adapt sandbox_pinctrl_gpio driver with the saved dir_flags in
  sandbox gpio driver
- rebase on v2020.01-rc3

Patrick Delaunay (14):
  dm: pinctrl: convert pinctrl-single to livetree
  dm: core: add ofnode and dev function to iterate on node property
  dm: pinctrl: migrate pinctrl-generic to livetree
  dt-bindings: gpio: document the new pull-up/pull-down flags
  gpio: remove GPIOD_REQUESTED
  gpio: remove the open_drain API and ops
  gpio: add gpio descriptor initialization helper
  gpio: add ops for configuration with dir flags
  dt-bindings: gpio: alignment with kernel v5.3
  pinctrl: sandbox: Add mux information in get_pin_muxing
  test: dm: update test for pins configuration in pinctrl node
  gpio: sandbox: cleanup binding support
  test: dm: update test for pins configuration in gpio
  test: pinmux: add pincontrol-gpio for pin configuration

 arch/sandbox/dts/test.dts               |  85 +++++--
 arch/sandbox/include/asm/gpio.h         |  38 +--
 doc/README.gpio                         |  42 ++++
 doc/device-tree-bindings/gpio/gpio.txt  | 304 ++++++++++++----------
 drivers/core/of_access.c                |  32 +++
 drivers/core/ofnode.c                   |  48 ++++
 drivers/core/read.c                     |  16 ++
 drivers/gpio/gpio-uclass.c              | 192 ++++++++++----
 drivers/gpio/mpc8xxx_gpio.c             |  22 --
 drivers/gpio/sandbox.c                  | 321 +++++++++++++++++++-----
 drivers/pinctrl/pinctrl-generic.c       |  30 +--
 drivers/pinctrl/pinctrl-sandbox.c       |  44 +++-
 drivers/pinctrl/pinctrl-single.c        |  27 +-
 include/asm-generic/gpio.h              | 104 ++++----
 include/dm/of_access.h                  |  40 +++
 include/dm/ofnode.h                     |  63 ++++-
 include/dm/read.h                       |  67 +++++
 include/dt-bindings/gpio/gpio.h         |   6 +
 include/dt-bindings/gpio/sandbox-gpio.h |  24 ++
 test/dm/gpio.c                          |  69 ++++-
 test/dm/test-fdt.c                      |   2 +-
 test/py/tests/test_pinmux.py            |  38 ++-
 22 files changed, 1216 insertions(+), 398 deletions(-)
 create mode 100644 doc/README.gpio
 create mode 100644 include/dt-bindings/gpio/sandbox-gpio.h

-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
