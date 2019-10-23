Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 68828E1D1C
	for <lists+uboot-stm32@lfdr.de>; Wed, 23 Oct 2019 15:45:07 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3238FC36B0F
	for <lists+uboot-stm32@lfdr.de>; Wed, 23 Oct 2019 13:45:07 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 14F07C36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Oct 2019 13:45:06 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9NDh5vu013985; Wed, 23 Oct 2019 15:44:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=nxF3ceWlrfwtaG5ZBoM2oYvxa2KQVE2A73Sb3FomJ7o=;
 b=fwuiwn8hy3uXUmsc64Z/rwie6WrJQG06pGtcnnOTDeIyHxVN2KqRyaguTiLcCXC9qKfe
 ejG6SzGEbaZ5CnvRKeYbZkPnZgh7gJBVv2C/ff6b5G8KcxVDvim71oF2sZA35u6DH5VB
 k9haa2b1zilOzXERS4D4TSjfeVcSPWmVvGiPMHt8Jwu4/JBXhLSUPCOK4v4xFmRFBJhm
 CgLFPVf41cmkaw55SwGRA5zlrAp3vuq6gVpY0xG+tG34pL/1jsR3xnsabMUx6blhVueN
 qSpq3R2YIaHlHeerVvotECsk9VnEN8WREWZ83RDvagP0ldhshyep5sFCkUt+eKIyuAWe +Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2vt9s4uxda-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Oct 2019 15:44:55 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F238410002A;
 Wed, 23 Oct 2019 15:44:53 +0200 (CEST)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CC9B02FF5F8;
 Wed, 23 Oct 2019 15:44:53 +0200 (CEST)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 23 Oct
 2019 15:44:53 +0200
Received: from localhost (10.201.21.107) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 23 Oct 2019 15:44:53
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 23 Oct 2019 15:44:35 +0200
Message-ID: <20191023134448.20149-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.201.21.107]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-23_03:2019-10-23,2019-10-23 signatures=0
Cc: Heiko Schocher <hs@denx.de>, Michael
 Trimarchi <michael@amarulasolutions.com>, Simon Glass <sjg@chromium.org>,
 Alex Marginean <alexandru.marginean@nxp.com>, Lukasz Majewski <lukma@denx.de>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>,
 Marek Vasut <marek.vasut+renesas@gmail.com>,
 Jean-Jacques Hiblot <jjhiblot@ti.com>, Bin Meng <bmeng.cn@gmail.com>,
 Adam Ford <aford173@gmail.com>, Christoph
 Muellner <christoph.muellner@theobroma-systems.com>
Subject: [Uboot-stm32] [PATCH 00/13] dm: add support of new binding in gpio
	and pincontrol
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

NB: In a second phasis set_open_drain/get_open_drain could be
    replaced by the new ops get_config/set_config to avoid to
    manage 2 API in parallel.

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

My working branch:
https://github.com/patrickdelaunay/u-boot/tree/dm

CI-Travis build:
https://travis-ci.org/patrickdelaunay/u-boot/builds/601829330


Regards

Patrick Delaunay



Patrick Delaunay (13):
  pinctrol: dm: remove the function pinctrl_decode_pin_config
  dm: pinctrl: convert pinctrl-single to livetree
  dm: core: add ofnode function to iterate on node property
  dm: pinctrl: migrate pinctrl-generic to livetree
  dt-bindings: gpio: document the new pull-up/pull-down flags
  gpio: add support for new flags on gpio configuration
  dt-bindings: gpio: alignment with kernel v5.3
  pinctrl: sandbox: Add mux information in get_pin_muxing
  test: dm: update test for pins configuration in pinctrl node
  gpio: sandbox: cleanup flag support
  gpio: sandbox: cleanup binding support
  test: dm: update test for pins configuration in gpio
  test: pinmux: add pincontrol-gpio for pin configuration

 arch/sandbox/dts/test.dts               |  85 +++++--
 doc/README.gpio                         |  42 ++++
 doc/device-tree-bindings/gpio/gpio.txt  | 304 ++++++++++++++----------
 drivers/core/of_access.c                |  32 +++
 drivers/core/ofnode.c                   |  45 ++++
 drivers/gpio/gpio-uclass.c              |  62 ++++-
 drivers/gpio/sandbox.c                  | 281 ++++++++++++++++++++--
 drivers/pinctrl/pinctrl-generic.c       |  36 ++-
 drivers/pinctrl/pinctrl-sandbox.c       |  44 +++-
 drivers/pinctrl/pinctrl-single.c        |  33 ++-
 drivers/pinctrl/pinctrl-uclass.c        |  12 -
 include/asm-generic/gpio.h              |  56 +++++
 include/dm/of_access.h                  |  40 ++++
 include/dm/ofnode.h                     |  39 ++-
 include/dm/pinctrl.h                    |  13 -
 include/dt-bindings/gpio/gpio.h         |   6 +
 include/dt-bindings/gpio/sandbox-gpio.h |  24 ++
 test/dm/gpio.c                          |  31 ++-
 test/dm/test-fdt.c                      |   2 +-
 test/py/tests/test_pinmux.py            |  38 ++-
 20 files changed, 984 insertions(+), 241 deletions(-)
 create mode 100644 doc/README.gpio
 create mode 100644 include/dt-bindings/gpio/sandbox-gpio.h

-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
