Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB77B1D5BF
	for <lists+uboot-stm32@lfdr.de>; Thu,  7 Aug 2025 12:24:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C289BC3F951;
	Thu,  7 Aug 2025 10:24:56 +0000 (UTC)
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 248C2C3F950
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 Aug 2025 10:24:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 187D71038C126; 
 Thu,  7 Aug 2025 12:24:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
 t=1754562292; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=Hobo4mnjzwFXMv8M7gjMtBWB2MMTmNII/qzQby0spns=;
 b=FeQ9l8qRZjnhR7dC9PzuIoIKmJ52M/AAqzvkuaKNB9b+LxQNcOaorAuwziBSUoDwA50F3d
 UcYBc09NL71/GX+RknhD69omEitys/PxmIVlPVPuok+dJBLgdw3McT9i0gLQWOxhYE6Ll5
 gTpLy5SZ/trIuYzXn/xp/NdvIWPPp+IpTrs094gFULdbopDnIrD3fkYe12pC6oHQoFJI0+
 uvJ7QJzcHYvhtJ4Mg5rttvDt2ZsIe0jhbF9jtKSGd6rQ1M/7JQFC5u6jIYfsoMssKaw48b
 kdMO86l9MQCeoMJ5x1wB23isYUyTS5Mt2sGdWqXamKjn2tNEapGAq6WYn9L8ug==
From: Philip Oberfichtner <pro@denx.de>
To: u-boot@lists.denx.de
Date: Thu,  7 Aug 2025 12:24:33 +0200
Message-Id: <20250807102436.452691-1-pro@denx.de>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Cc: Peng Fan <peng.fan@nxp.com>, Fabio Estevam <festevam@denx.de>,
 Casey Connolly <casey.connolly@linaro.org>,
 Mattijs Korpershoek <mkorpershoek@kernel.org>,
 Quentin Schulz <quentin.schulz@cherry.de>, Phil Sutter <phil@nwl.cc>,
 Paul Kocialkowski <contact@paulk.fr>, Sean Anderson <seanga2@gmail.com>,
 "Albert ARIBAUD \(3ADEV\)" <albert.aribaud@3adev.fr>,
 Soeren Moch <smoch@web.de>, Marek Behun <kabel@kernel.org>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Jason Liu <jason.hui.liu@nxp.com>, Dragan Simic <dsimic@manjaro.org>,
 Patrick Rudolph <patrick.rudolph@9elements.com>, Marek Vasut <marex@denx.de>,
 Tom Rini <trini@konsulko.com>, Stefan Roese <sr@denx.de>,
 Otavio Salvador <otavio@ossystems.com.br>,
 Ibai Erkiaga <ibai.erkiaga-elorza@amd.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Lukasz Majewski <lukma@denx.de>,
 Nathan Barrett-Morrison <nathan.morrison@timesys.com>,
 Breno Lima <breno.lima@nxp.com>, Tony Dinh <mibodhi@gmail.com>,
 Adriano Cordova <adrianox@gmail.com>, Anatolij Gustschin <agust@denx.de>,
 Gary Bisson <bisson.gary@gmail.com>, Ye Li <ye.li@nxp.com>,
 Siddarth Gore <gores@marvell.com>, David Lechner <david@lechnology.com>,
 Jerome Forissier <jerome.forissier@linaro.org>,
 Marek Mojik <marek.mojik@nic.cz>, Oliver Gaskell <Oliver.Gaskell@analog.com>,
 Andre Przywara <andre.przywara@arm.com>, Alison Wang <alison.wang@nxp.com>,
 Philip Oberfichtner <pro@denx.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Richard Hu <richard.hu@technexion.com>, Anshul Dalal <anshuld@ti.com>,
 Venkatesh Yadav Abbarapu <venkatesh.abbarapu@amd.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Michal Simek <michal.simek@amd.com>, Trevor Woerner <twoerner@gmail.com>,
 Ezra Buehler <ezra.buehler@husqvarnagroup.com>,
 Raymond Mao <raymond.mao@linaro.org>, Heiko Schocher <hs@denx.de>,
 u-boot@dh-electronics.com, Greg Malysa <malysagreg@gmail.com>,
 Simon Glass <sjg@chromium.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Michael Walle <michael@walle.cc>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Tomas Peterka <atheiste@seznam.cz>,
 Francesco Montefoschi <francesco.montefoschi@udoo.org>,
 Paul Barker <paul.barker.ct@bp.renesas.com>,
 Pascal Zimmermann <pzimmermann@dh-electronics.com>
Subject: [Uboot-stm32] [PATCH v2 0/3] Simplify image size checks
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

Depends on:
	- https://patchwork.ozlabs.org/project/uboot/patch/20250807075653.356088-2-pro@denx.de/
	- https://patchwork.ozlabs.org/project/uboot/patch/20250807075653.356088-3-pro@denx.de/

This patch series intends to simplify the image size checks, which currently
exist in multiple flavours:

	CONFIG_HAS_BOARD_SIZE_LIMIT
	CONFIG_BOARD_SIZE_LIMIT
	CONFIG_UBOOT_WITH_SPL_SIZE_LIMIT
	CONFIG_SPL_SIZE_LIMIT
	CONFIG_SPL_SIZE_LIMIT_SUBTRACT_GD
	CONFIG_SPL_SIZE_LIMIT_SUBTRACT_MALLOC
	CONFIG_SPL_SIZE_LIMIT_PROVIDE_STACK
	CONFIG_TPL_SIZE_LIMIT
	CONFIG_VPL_SIZE_LIMIT

After this series, we would have
	- Less code duplication in the toplevel Makefile
	- Consistent logic for all the different CONFIGS
	- All related options in one place

Changes in v2:
	- Rebase on current master
	- Rebase on my pending mips patch series (linked above)
	- Incorporated Heinrich's Review

Philip Oberfichtner (3):
  Image size checks: Remove HAS_BOARD_SIZE_LIMIT
  Image size checks: Move all configs in one place
  Image size checks: Simplify help text

 Kconfig                                       | 80 ++++++++++++++++---
 cmd/Kconfig                                   |  2 +-
 common/spl/Kconfig                            | 45 -----------
 common/spl/Kconfig.tpl                        |  7 --
 common/spl/Kconfig.vpl                        |  7 --
 configs/bk4r1_defconfig                       |  1 -
 configs/chromebook_link_defconfig             |  1 -
 configs/colibri_vf_defconfig                  |  1 -
 configs/ea-lpc3250devkitv2_defconfig          |  1 -
 .../gardena-smart-gateway-mt7688_defconfig    |  1 -
 configs/guruplug_defconfig                    |  1 -
 configs/imx28_btt3_defconfig                  |  1 -
 configs/imx28_xea_defconfig                   |  1 -
 configs/legoev3_defconfig                     |  1 -
 configs/linkit-smart-7688_defconfig           |  1 -
 configs/lschlv2_defconfig                     |  1 -
 configs/lsxhl_defconfig                       |  1 -
 configs/lxr2_defconfig                        |  1 -
 configs/mx51evk_defconfig                     |  1 -
 configs/mx53loco_defconfig                    |  1 -
 configs/mx6sabresd_defconfig                  |  1 -
 configs/mx7ulp_com_defconfig                  |  1 -
 configs/openrd_base_defconfig                 |  1 -
 configs/openrd_client_defconfig               |  1 -
 configs/openrd_ultimate_defconfig             |  1 -
 configs/pcm052_defconfig                      |  1 -
 configs/pico-dwarf-imx6ul_defconfig           |  1 -
 configs/pico-dwarf-imx7d_defconfig            |  1 -
 configs/pico-hobbit-imx6ul_defconfig          |  1 -
 configs/pico-hobbit-imx7d_defconfig           |  1 -
 configs/pico-imx6_defconfig                   |  1 -
 configs/pico-imx6ul_defconfig                 |  1 -
 configs/pico-imx7d_bl33_defconfig             |  1 -
 configs/pico-imx7d_defconfig                  |  1 -
 configs/pico-nymph-imx7d_defconfig            |  1 -
 configs/pico-pi-imx6ul_defconfig              |  1 -
 configs/pico-pi-imx7d_defconfig               |  1 -
 configs/sheevaplug_defconfig                  |  1 -
 configs/stm32mp15_dhsom.config                |  1 -
 configs/tbs2910_defconfig                     |  1 -
 configs/turris_1x_nor_defconfig               |  1 -
 configs/turris_1x_sdcard_defconfig            |  1 -
 configs/turris_omnia_defconfig                |  1 -
 configs/udoo_neo_defconfig                    |  1 -
 configs/vf610twr_defconfig                    |  1 -
 configs/vf610twr_nand_defconfig               |  1 -
 configs/warp7_bl33_defconfig                  |  1 -
 configs/warp7_defconfig                       |  1 -
 lib/efi_loader/Kconfig                        |  6 +-
 49 files changed, 72 insertions(+), 118 deletions(-)

-- 
2.39.5

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
