Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA1017337A
	for <lists+uboot-stm32@lfdr.de>; Fri, 28 Feb 2020 10:04:31 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4C064C36B0A
	for <lists+uboot-stm32@lfdr.de>; Fri, 28 Feb 2020 09:04:31 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1570BC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Feb 2020 09:04:27 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01S8x6j9001274; Fri, 28 Feb 2020 10:04:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=y2AruO9EmwNoDbpF9rfSx/ZCNx45ul1FYIzdsz2/I7k=;
 b=h4is1gQeOtlnVriBkfQXQqt+HKo42O94qiv0NxVHF26J5hSkbsEhRKkvgQXVqzEGaAqw
 tGeaBZVcKV8ffguWjgS7Q0iS0fpSMTcFUF7UNNdfkx7A6vfRsy9FB6HllGQ4XlNkT5+o
 R7qTHMlTcSNR3/Y1m4HaYeTTo+N9uuxN1QhfgzkkAMXuKB07+SYWmPYpu+fmnAeHgj6B
 PKNhvipgdbmB9YNIOyPHjzvjU7xncPU7bbjOeaKeeg3fNmiYNiOJfqtFLOrGfpXPon+T
 yC3rV4QpEsLCFPdTIlwuxWaDAWJ93D2PFc7Tjwa5TX+7WowWXfAKqvalh6szZii+dC1S IA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yepvttra1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Feb 2020 10:04:22 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2204B10002A;
 Fri, 28 Feb 2020 10:04:20 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 125772A970F;
 Fri, 28 Feb 2020 10:04:20 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 28 Feb
 2020 10:04:19 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 28 Feb 2020 10:04:19 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Tom Rini <trini@konsulko.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>
Thread-Topic: [PATCH] doc: Makefile: remove target refcheckdocs
Thread-Index: AQHV7AVtHiVKe3T6VEi/n/bZLGLOU6gsJMmAgAAJmoCABBl14A==
Date: Fri, 28 Feb 2020 09:04:19 +0000
Message-ID: <a86f67e4b21e4c319704d5a68d4f32ee@SFHDAG6NODE3.st.com>
References: <20200225180011.8129-1-patrick.delaunay@st.com>
 <f435e69b-7e4f-b58b-8903-eda993c60792@gmx.de>
 <20200225184423.GK18302@bill-the-cat>
In-Reply-To: <20200225184423.GK18302@bill-the-cat>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-28_02:2020-02-26,
 2020-02-28 signatures=0
Cc: Breno Matheus Lima <breno.lima@nxp.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Bin Meng <bmeng.cn@gmail.com>
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Hi Heinrich,

> From: Tom Rini <trini@konsulko.com>
> Sent: mardi 25 f=E9vrier 2020 19:44
> =

> On Tue, Feb 25, 2020 at 07:10:01PM +0100, Heinrich Schuchardt wrote:
> > On 2/25/20 7:00 PM, Patrick Delaunay wrote:
> > > Remove the target refcheckdocs, based on the missing script
> > > scripts/documentation-file-ref-check.
> > >
> > > This script exists in Linux tree but wasn't imported when 'doc' move
> > > to SPHINX in commit 78a88f7930be ("doc: Replace DocBook with
> > > sphinx-based docs")
> > >
> > > This patch avoids the error:
> > >
> > > make refcheckdocs
> > > /bin/sh: scripts/documentation-file-ref-check: No such file or
> > > directory
> > > doc/Makefile:102: recipe for target 'refcheckdocs' failed
> > > make[1]: *** [refcheckdocs] Error 127
> > > Makefile:2094: recipe for target 'refcheckdocs' failed
> > > make: *** [refcheckdocs] Error 2
> > >
> > > Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> >
> > When we copy and adjust the missing script we can identify dozens of
> > documentation errors, see below. So I think we should fix the make
> > target instead of removing it.
> >
> > arch/arm/mach-imx/Kconfig: doc/README.mxc_hab
> > arch/arm/mach-imx/Kconfig: doc/README.mxc_hab
> > board/advantech/dms-ba16/dms-ba16_1g.cfg: doc/README.imximage
> > board/advantech/dms-ba16/dms-ba16_2g.cfg: doc/README.imximage
> > board/aristainetos/aristainetos2.cfg: doc/README.imximage
> > board/bachmann/ot1200/mx6q_4x_mt41j128.cfg: doc/README.imximage
> > board/barco/titanium/imximage.cfg: doc/README.imximage
> > board/boundary/nitrogen6x/nitrogen6dl.cfg: doc/README.imximage
> > board/boundary/nitrogen6x/nitrogen6dl2g.cfg: doc/README.imximage
> > board/boundary/nitrogen6x/nitrogen6q.cfg: doc/README.imximage
> > board/boundary/nitrogen6x/nitrogen6q2g.cfg: doc/README.imximage
> > board/boundary/nitrogen6x/nitrogen6s.cfg: doc/README.imximage
> > board/boundary/nitrogen6x/nitrogen6s1g.cfg: doc/README.imximage
> > board/ccv/xpress/imximage.cfg: doc/README.imximage
> > board/cobra5272/README: u-boot-x-x-x/doc/README.COBRA5272
> > board/freescale/imx8qxp_mek/imximage.cfg: doc/README.imx8image
> > board/freescale/m52277evb/README: doc/README.m52277evb
> > board/freescale/m53017evb/README: doc/README.m53017evb
> > board/freescale/m5373evb/README: doc/README.m5373evb
> > board/freescale/m54455evb/README: doc/README.m54455evb
> > board/freescale/m547xevb/README: doc/README.m5475evb
> > board/freescale/mx25pdk/imximage.cfg: doc/README.imximage
> > board/freescale/mx51evk/imximage.cfg: doc/README.imximage
> > board/freescale/mx53ard/imximage_dd3.cfg: doc/README.imximage
> > board/freescale/mx53evk/imximage.cfg: doc/README.imximage
> > board/freescale/mx53loco/imximage.cfg: doc/README.imximage
> > board/freescale/mx53smd/imximage.cfg: doc/README.imximage
> > board/freescale/mx6qarm2/imximage.cfg: doc/README.imximage
> > board/freescale/mx6qarm2/imximage_mx6dl.cfg: doc/README.imximage
> > board/freescale/mx6slevk/imximage.cfg: doc/README.imximage
> > board/freescale/mx6ullevk/imximage.cfg: doc/README.imximage
> > board/freescale/mx7dsabresd/imximage.cfg: doc/README.imximage
> > board/freescale/s32v234evb/s32v234evb.cfg: doc/README.imximage
> > board/freescale/vf610twr/imximage.cfg: doc/README.imximage
> > board/ge/bx50v3/bx50v3.cfg: doc/README.imximage
> > board/ge/mx53ppd/imximage.cfg: doc/README.imximage
> > board/menlo/m53menlo/imximage.cfg: doc/README.imximage
> > board/phytec/pcm052/imximage.cfg: doc/README.imximage
> > board/seco/mx6quq7/mx6quq7-2g.cfg: doc/README.imximage
> > board/siemens/capricorn/imximage.cfg: doc/README.imx8image
> > board/technexion/pico-imx6ul/imximage.cfg: doc/README.imximage
> > board/toradex/apalis-imx8/apalis-imx8qm-imximage.cfg:
> > doc/README.imx8image
> > board/toradex/colibri-imx6ull/imximage.cfg: doc/README.imximage
> > board/toradex/colibri-imx8x/colibri-imx8qxp-imximage.cfg:
> > doc/README.imx8image
> > board/toradex/colibri_imx7/imximage.cfg: doc/README.imximage
> > board/toradex/colibri_vf/imximage.cfg: doc/README.imximage
> > board/tqc/tqma6/clocks.cfg: doc/README.imximage
> > board/tqc/tqma6/tqma6dl.cfg: doc/README.imximage
> > board/tqc/tqma6/tqma6q.cfg: doc/README.imximage
> > board/tqc/tqma6/tqma6s.cfg: doc/README.imximage
> > board/warp/imximage.cfg: doc/README.imximage
> > board/warp7/imximage.cfg: doc/README.imximage
> > cmd/Kconfig: doc/README.beddbug
> > doc/README.drivers.eth: doc/driver-model/README.txt
> > doc/README.fdt-control: doc/driver-model/README.txt
> > doc/device-tree-bindings/net/ti,dp83867.txt:
> > doc/devicetree/bindings/net/ethernet.txt
> > doc/device-tree-bindings/video/rockchip-lvds.txt:
> > doc/devicetree/device-tree-bindings/video/display-timing.txt
> > doc/imx/misc/sdp.txt: doc/README.imximage
> > doc/sphinx/parse-headers.pl: doc/doc-guide/parse-headers.rst
> > doc/sphinx/rstFlatTable.py: doc/books/kernel-doc-HOWTO
> > drivers/i2c/davinci_i2c.c: doc/driver-model/i2c-howto.txt
> > drivers/i2c/kona_i2c.c: doc/driver-model/i2c-howto.txt
> > drivers/i2c/sh_i2c.c: doc/driver-model/i2c-howto.txt
> > drivers/i2c/soft_i2c.c: doc/driver-model/i2c-howto.txt
> > drivers/rtc/ds1374.c: Watchdoc/Alarm
> > include/ata.h: ftp://ftp.fee.vutbr.cz/pub/doc/io/ata/ata-3/ata3r5v.zip
> > include/configs/sbc8548.h: doc/README.sbc8548
> > include/fsl_qe.h: doc/README.qe_firmware
> > lib/zlib/trees.c: ftp.uu.net:/pub/archiving/zip/doc/deflate-1.1.doc
> > tools/dtoc/dtb_platdata.py: doc/driver-model/of-plat.txt
> > tools/dtoc/dtoc.py: doc/driver-model/of-plat.txt
> =

> Agreed.  And then make new errors a CI fatal?  Thanks!

Agreed also.
I did not have the courage to do it (in fact: I started, but I did not succ=
eed and I give up)

FYI: that can't be CI fatal today, because the current script give too many=
 false positive

For example : =

	board/aristainetos/aristainetos2.cfg: doc/README.imximage
	cmd/Kconfig: doc/README.beddbug

	=3D> these file exist

Thanks

> --
> Tom
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
