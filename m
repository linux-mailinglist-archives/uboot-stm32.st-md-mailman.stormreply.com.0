Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F0DB16ED88
	for <lists+uboot-stm32@lfdr.de>; Tue, 25 Feb 2020 19:10:11 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 234C7C36B0A
	for <lists+uboot-stm32@lfdr.de>; Tue, 25 Feb 2020 18:10:11 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9D713C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Feb 2020 18:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1582654205;
 bh=Wz7Id6ixI7Q92lFZ2HwrqlkeLXC/Gqc3mgosA05Ru8Y=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=BaH/oExkYAkwEDCADihCN8FpNtBKzXkvjIS+3SAcaInzsqWPNQND0u3lZd28dJRE2
 izZtE7MiY/2BISj8BD8ek/1UouX1jhCUY/EldGslxsfk927S76C5d1NItZqXNR4Buy
 av6a4a+reLi64FUpktplbU5N023XBaXCbLeq5ZVU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.123.51] ([84.119.33.160]) by mail.gmx.com (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N8XTv-1jSQii2icT-014Qr2; Tue, 25
 Feb 2020 19:10:05 +0100
To: Patrick Delaunay <patrick.delaunay@st.com>, u-boot@lists.denx.de
References: <20200225180011.8129-1-patrick.delaunay@st.com>
From: Heinrich Schuchardt <xypron.glpk@gmx.de>
Message-ID: <f435e69b-7e4f-b58b-8903-eda993c60792@gmx.de>
Date: Tue, 25 Feb 2020 19:10:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200225180011.8129-1-patrick.delaunay@st.com>
Content-Language: en-US
X-Provags-ID: V03:K1:radayE1bEqpKg+hD4SLzoh60clzolb5YgAKUgXiDN2o9/eN8fk9
 +K8JD8PmO6wQ4M/c9Mo/GOBGJMlGXE2N6rD2ulLNCghAImm0XfyiylIYiF9UNXMavONAdMw
 iZ0Al2BjFQVo5WASPb/nq2mZyGfMovLjK1RsQOiajx2N9hUwRHwlxWc6B4veKs0W308BwV6
 zeUV+xQi9L8VCpeIbKQYQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:86kR5VECCC8=:HyvZRLzCWd8zpUHaPtQPRV
 CuVyGZtwGJ+sx9gKT1LT9VuWYKdFKlssZ2RtKqfTATPJ7Hd295Gqh5P6cz67EZ+RcaQnaXcDn
 M+86TVLFjIL37XF2K6UBBya59ohwYPAisrlvrOvH2MkJcw6KCILS8U+UsHTrB1EoX5sC020vy
 pLfWS3tfKNhpP4JJpV+v6ziimMYw6uy2fsHHtGaxr4RvyAfIxFHr08PM9iSimlKiDhAsnXXYA
 8hSilwGEHNWfTY5ckqEcJBFzDlMdjmrdNT0UPhzYGJyXWNJ5X+zuH6Z/LpxtxeLJQvaYikuWw
 ohwLYOi40K5IOmDx5uYePo7CJFSfbVtemVLv03udOA7dcI1evC7PZOAJVmhRAODrirxRZlGsz
 kUISsyx73E/BFpVmZXJ0hTKyXDxOr1FUBgQe9F41TcSSlFewzhzwHQy22no1FifYrbiz7Bxu+
 kdN6MKBdI32CEMNrV7L0xFaZSh5HKXInYfM4IWB1Xxn1/t7g2WuVAmccmQNQkcURxPRTFdJC6
 Ybbg87/f30WanG7/MLNJffyMHZpDraC+5cgoa0y32p2tgS4ekuJd2pG9f4xl9+E2hr6qLa7vm
 wJN/mmJOOMJ8bA8fy3IKZdXsvBkn9lPf0FsVJgg80Q4DQDdwUBkjKYbUAiYSo5onf/6g8vwOb
 sepokINCs7DHWVOKK4yq/UCJE0HmgqKEtXMovSXhWqHfYJ2mBOCEbNqo8saQc9ek1aSxrWkXX
 Vaj1G5IW/5rh73O6Th7umCD/LyvlFQwiidwZSEtUeMvxpTFhfQxTewQjti2IPcZMmOnJyk4z0
 HK8PgNVqC0iQF2AE/nFB7ItNbMgnmBbzEQHAUe8/RcTQeb89qQs3GVI4a9BdPpjwr8ASuUL4h
 aca9O+3DBt91u6qxgaJK5EXTJnvWUXZ0/wcwdzm2MrqpWqSxIshzW11XquZ9D2GsBFjtN+ZDw
 5AWwoWXYehtZp5PNHXcvJx8kt3l4sSdV8SYJo/z/5G0ycCNTT+6Y063X8+JFmrfB1KClm39FB
 FSjqDVq82+Cgp2t/kUkOxI+u09l8sF9/yne6zD4dwQrdn6UbovYKm8qJ8wlyjFqCO7vDmAEpU
 9QO/itKg7RgG+YLgjzRjn/udEq0Ctw7MHFw2YLcB2VXn4CSKaOfDf9EgOqvjT1jX35J9qpkmn
 3DePELH/2j44rpmY9r9mFHXSqCXWoErlfRqrebPOUOnji18WuwucjOOmeMLksYWIZUGB1UGVV
 Ffcd2pIwpH15rb9Mw
Cc: Breno Matheus Lima <breno.lima@nxp.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Bin Meng <bmeng.cn@gmail.com>, Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH] doc: Makefile: remove target refcheckdocs
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

On 2/25/20 7:00 PM, Patrick Delaunay wrote:
> Remove the target refcheckdocs, based on the missing script
> scripts/documentation-file-ref-check.
>
> This script exists in Linux tree but wasn't imported when 'doc' move
> to SPHINX in commit 78a88f7930be ("doc: Replace DocBook with
> sphinx-based docs")
>
> This patch avoids the error:
>
> make refcheckdocs
> /bin/sh: scripts/documentation-file-ref-check: No such file or directory
> doc/Makefile:102: recipe for target 'refcheckdocs' failed
> make[1]: *** [refcheckdocs] Error 127
> Makefile:2094: recipe for target 'refcheckdocs' failed
> make: *** [refcheckdocs] Error 2
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>

When we copy and adjust the missing script we can identify dozens of
documentation errors, see below. So I think we should fix the make
target instead of removing it.

arch/arm/mach-imx/Kconfig: doc/README.mxc_hab
arch/arm/mach-imx/Kconfig: doc/README.mxc_hab
board/advantech/dms-ba16/dms-ba16_1g.cfg: doc/README.imximage
board/advantech/dms-ba16/dms-ba16_2g.cfg: doc/README.imximage
board/aristainetos/aristainetos2.cfg: doc/README.imximage
board/bachmann/ot1200/mx6q_4x_mt41j128.cfg: doc/README.imximage
board/barco/titanium/imximage.cfg: doc/README.imximage
board/boundary/nitrogen6x/nitrogen6dl.cfg: doc/README.imximage
board/boundary/nitrogen6x/nitrogen6dl2g.cfg: doc/README.imximage
board/boundary/nitrogen6x/nitrogen6q.cfg: doc/README.imximage
board/boundary/nitrogen6x/nitrogen6q2g.cfg: doc/README.imximage
board/boundary/nitrogen6x/nitrogen6s.cfg: doc/README.imximage
board/boundary/nitrogen6x/nitrogen6s1g.cfg: doc/README.imximage
board/ccv/xpress/imximage.cfg: doc/README.imximage
board/cobra5272/README: u-boot-x-x-x/doc/README.COBRA5272
board/freescale/imx8qxp_mek/imximage.cfg: doc/README.imx8image
board/freescale/m52277evb/README: doc/README.m52277evb
board/freescale/m53017evb/README: doc/README.m53017evb
board/freescale/m5373evb/README: doc/README.m5373evb
board/freescale/m54455evb/README: doc/README.m54455evb
board/freescale/m547xevb/README: doc/README.m5475evb
board/freescale/mx25pdk/imximage.cfg: doc/README.imximage
board/freescale/mx51evk/imximage.cfg: doc/README.imximage
board/freescale/mx53ard/imximage_dd3.cfg: doc/README.imximage
board/freescale/mx53evk/imximage.cfg: doc/README.imximage
board/freescale/mx53loco/imximage.cfg: doc/README.imximage
board/freescale/mx53smd/imximage.cfg: doc/README.imximage
board/freescale/mx6qarm2/imximage.cfg: doc/README.imximage
board/freescale/mx6qarm2/imximage_mx6dl.cfg: doc/README.imximage
board/freescale/mx6slevk/imximage.cfg: doc/README.imximage
board/freescale/mx6ullevk/imximage.cfg: doc/README.imximage
board/freescale/mx7dsabresd/imximage.cfg: doc/README.imximage
board/freescale/s32v234evb/s32v234evb.cfg: doc/README.imximage
board/freescale/vf610twr/imximage.cfg: doc/README.imximage
board/ge/bx50v3/bx50v3.cfg: doc/README.imximage
board/ge/mx53ppd/imximage.cfg: doc/README.imximage
board/menlo/m53menlo/imximage.cfg: doc/README.imximage
board/phytec/pcm052/imximage.cfg: doc/README.imximage
board/seco/mx6quq7/mx6quq7-2g.cfg: doc/README.imximage
board/siemens/capricorn/imximage.cfg: doc/README.imx8image
board/technexion/pico-imx6ul/imximage.cfg: doc/README.imximage
board/toradex/apalis-imx8/apalis-imx8qm-imximage.cfg: doc/README.imx8image
board/toradex/colibri-imx6ull/imximage.cfg: doc/README.imximage
board/toradex/colibri-imx8x/colibri-imx8qxp-imximage.cfg:
doc/README.imx8image
board/toradex/colibri_imx7/imximage.cfg: doc/README.imximage
board/toradex/colibri_vf/imximage.cfg: doc/README.imximage
board/tqc/tqma6/clocks.cfg: doc/README.imximage
board/tqc/tqma6/tqma6dl.cfg: doc/README.imximage
board/tqc/tqma6/tqma6q.cfg: doc/README.imximage
board/tqc/tqma6/tqma6s.cfg: doc/README.imximage
board/warp/imximage.cfg: doc/README.imximage
board/warp7/imximage.cfg: doc/README.imximage
cmd/Kconfig: doc/README.beddbug
doc/README.drivers.eth: doc/driver-model/README.txt
doc/README.fdt-control: doc/driver-model/README.txt
doc/device-tree-bindings/net/ti,dp83867.txt:
doc/devicetree/bindings/net/ethernet.txt
doc/device-tree-bindings/video/rockchip-lvds.txt:
doc/devicetree/device-tree-bindings/video/display-timing.txt
doc/imx/misc/sdp.txt: doc/README.imximage
doc/sphinx/parse-headers.pl: doc/doc-guide/parse-headers.rst
doc/sphinx/rstFlatTable.py: doc/books/kernel-doc-HOWTO
drivers/i2c/davinci_i2c.c: doc/driver-model/i2c-howto.txt
drivers/i2c/kona_i2c.c: doc/driver-model/i2c-howto.txt
drivers/i2c/sh_i2c.c: doc/driver-model/i2c-howto.txt
drivers/i2c/soft_i2c.c: doc/driver-model/i2c-howto.txt
drivers/rtc/ds1374.c: Watchdoc/Alarm
include/ata.h: ftp://ftp.fee.vutbr.cz/pub/doc/io/ata/ata-3/ata3r5v.zip
include/configs/sbc8548.h: doc/README.sbc8548
include/fsl_qe.h: doc/README.qe_firmware
lib/zlib/trees.c: ftp.uu.net:/pub/archiving/zip/doc/deflate-1.1.doc
tools/dtoc/dtb_platdata.py: doc/driver-model/of-plat.txt
tools/dtoc/dtoc.py: doc/driver-model/of-plat.txt

Best regards

Heinrich
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
