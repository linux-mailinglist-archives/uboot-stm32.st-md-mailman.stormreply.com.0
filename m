Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 345B7138F33
	for <lists+uboot-stm32@lfdr.de>; Mon, 13 Jan 2020 11:35:24 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EA50BC36B16
	for <lists+uboot-stm32@lfdr.de>; Mon, 13 Jan 2020 10:35:23 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0206EC36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jan 2020 10:35:22 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00DASPDv006813; Mon, 13 Jan 2020 11:35:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=3i/+mdBNnDMzryzj0cfBFggSWtToJc1p6ElfbXeGRso=;
 b=U8NAY3gUqSEO6C9mcVB5NEk6Bu/1vyLUqF7YhXGj03PEOG2Y6D0o3MrTkCzcDCMg6wCg
 wNGAItGANhvTUVjLNo8n4j+D0jpsmXHEI6dCpaXDvljCCwvFwgOGj/IvlWk8l3rabgQI
 szTFLOA/Hha8BLtz8xjcSq2Wd+ovUKmGENOMcoR1RjVWft8UTCNvvjLMA+neb/bwv7Fu
 2l1IzA0QkHylhvd0svQCo7vk8wmmMsabLNpdKyh5RAwCs6n5enob4mTtLU9CtQWBh5QY
 OFZ59jvP/pkiQIM9XVP17ULdCt+C8f7cs/UgFm0TfzVknDSXP5+UgJTCWRsoQ0drN3Go Rw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xf7jp7htk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Jan 2020 11:35:18 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A8C8E10002A;
 Mon, 13 Jan 2020 11:35:17 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 921B72A96EA;
 Mon, 13 Jan 2020 11:35:17 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Mon, 13 Jan 2020 11:35:17 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 13 Jan 2020 11:34:54 +0100
Message-ID: <20200113103515.20879-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-13_02:2020-01-13,
 2020-01-13 signatures=0
Cc: Bin Meng <bmeng.cn@gmail.com>, Simon Glass <sjg@chromium.org>,
 Alex Marginean <alexandru.marginean@nxp.com>, Lukasz Majewski <lukma@denx.de>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Jean-Jacques Hiblot <jjhiblot@ti.com>, Heiko Schocher <hs@denx.de>,
 Adam Ford <aford173@gmail.com>
Subject: [Uboot-stm32] [PATCH v3 00/21] dm: add support of new binding in
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

it is the V3 of "dm: add support of new binding in gpio and pincontrol"
http://patchwork.ozlabs.org/project/uboot/list/?series=145044

I rebase on v2020.01 and made some minor update after Simon Glass review.
And I also split the previous patch was part of v2 08/14 to help review
	http://patchwork.ozlabs.org/patch/1200865/
	"gpio: add ops for configuration with dir flags"

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

------------------------------------------------------ Captured stdout call -------------------------------------------------------
=> ut dm power_domain
Test: dm_test_power_domain: power-domain.c
../test/dm/test-main.c:72, dm_test_destroy(): 0 == uclass_destroy(uc): Expected 0x0 (0), got 0xffffffea (-22)
../test/dm/test-main.c:107, dm_do_test(): 0 == dm_test_destroy(uts): Expected 0x0 (0), got 0x1 (1)
../test/dm/test-main.c:169, dm_test_main(): 0 == dm_do_test(uts, test, 1): Expected 0x0 (0), got 0x1 (1)
=>

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
but my serie is not the root cause of the issue.

Workaround to allow test execution:
  "dm: core: device: don't probe pinctrl for power domain"

My working branch:
https://github.com/patrickdelaunay/u-boot/tree/dm

Regards

Patrick Delaunay


Changes in v3:
- add test dm_test_ofnode_get_property_by_prop
- udpate ofnode example in commit message
- solve comment for ofnode_get_property_by_prop (and not by of_ofprop)
- Split the previous patch [PATCH v2 08/14] to help review
- Split the previous patch [PATCH v2 08/14] to help review
- Split the previous patch [PATCH v2 08/14] to help review
- Split the previous patch [PATCH v2 08/14] to help review
- Split the previous patch [PATCH v2 08/14] to help review
- Split the previous patch [PATCH v2 08/14] to help review
- Split the previous patch [PATCH v2 08/14] to help review
- Split the previous patch [PATCH v2 08/14] to help review

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

Patrick Delaunay (21):
  dm: pinctrl: convert pinctrl-single to livetree
  dm: core: add ofnode and dev function to iterate on node property
  dm: pinctrl: migrate pinctrl-generic to livetree
  dt-bindings: gpio: document the new pull-up/pull-down flags
  gpio: remove GPIOD_REQUESTED
  gpio: remove the open_drain API and ops
  gpio: add gpio descriptor initialization helper
  gpio: add function _gpio_get_value
  gpio: add function _dm_gpio_set_dir_flags
  gpio: add function check_dir_flags
  gpio: add helper GPIOD_FLAGS_OUTPUT
  gpio: update dir_flags management
  gpio: add support of new GPIO direction flag
  gpio: add ops to get dir flags
  gpio: add ops to set dir flags
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
 drivers/gpio/gpio-uclass.c              | 203 +++++++++++----
 drivers/gpio/mpc8xxx_gpio.c             |  22 --
 drivers/gpio/sandbox.c                  | 321 +++++++++++++++++++-----
 drivers/pinctrl/pinctrl-generic.c       |  30 +--
 drivers/pinctrl/pinctrl-sandbox.c       |  44 +++-
 drivers/pinctrl/pinctrl-single.c        |  27 +-
 include/asm-generic/gpio.h              | 102 ++++----
 include/dm/of_access.h                  |  40 +++
 include/dm/ofnode.h                     |  63 ++++-
 include/dm/read.h                       |  67 +++++
 include/dt-bindings/gpio/gpio.h         |   6 +
 include/dt-bindings/gpio/sandbox-gpio.h |  24 ++
 test/dm/Makefile                        |   1 +
 test/dm/gpio.c                          |  69 ++++-
 test/dm/ofread.c                        |  50 ++++
 test/dm/test-fdt.c                      |   2 +-
 test/py/tests/test_pinmux.py            |  38 ++-
 24 files changed, 1275 insertions(+), 399 deletions(-)
 create mode 100644 doc/README.gpio
 create mode 100644 include/dt-bindings/gpio/sandbox-gpio.h
 create mode 100644 test/dm/ofread.c

-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
