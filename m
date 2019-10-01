Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 47552C2EAA
	for <lists+uboot-stm32@lfdr.de>; Tue,  1 Oct 2019 10:12:11 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DE75EC36B0A
	for <lists+uboot-stm32@lfdr.de>; Tue,  1 Oct 2019 08:12:10 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A09C1C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  1 Oct 2019 08:12:09 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x918BBUh011052; Tue, 1 Oct 2019 10:11:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=Sx+Ww+NbZn1Y0wc9q5nYMpydgvS7xkzWNwu3UHRuTZM=;
 b=K4zT3dfjUWNSShs5w3d2XEERbHYFx7ayLAW2pdi5SROHRDFUZIehMqepU0IHa/oiNjWg
 CczWD9Pa5Q0RxkhSFDB/nbc0dHjVUeY2jrL/yjRmc31i39ldsEFEUKO1v8/UJ3KO+N3Z
 2Gpgi4rs3BRIaxj5EzfGnxCpjmL8GbR3rIxiOSfY/agdOEB4vyCRA+6sxR5FRXyVvilB
 QgaXoy9uloTA0ICy8/4gkGvOhY9mhW8v93PBlkq2Jm/jQbuaddMNYmsI2a6inUzTclgZ
 q2Yrgqzsul5lepVPUzBmT7bciOA80vvHVlNvjrcjuCp2gbHkEQUrl/1KU2CQxXCj59NW Kg== 
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com with ESMTP id 2v9w9vqja5-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 01 Oct 2019 10:11:26 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 2F77823;
 Tue,  1 Oct 2019 08:11:11 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 00EB02AF4D4;
 Tue,  1 Oct 2019 10:11:11 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 1 Oct
 2019 10:11:10 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 1 Oct 2019 10:11:10 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Tom Rini <trini@konsulko.com>, Stefan Roese <sr@denx.de>, Wolfgang Denk
 <wd@denx.de>
Thread-Topic: [U-Boot] [PATCH v3 0/3] env: Add CONFIG_ENV_FULL_SUPPORT
Thread-Index: AQHVbgOiinOinVx3e0q2YllyRlA5Bqc0KJYAgACmAgCACPDh4IAHvrHg
Date: Tue, 1 Oct 2019 08:11:10 +0000
Message-ID: <a7416d05aa694b4db76e2b9120c282c1@SFHDAG6NODE3.st.com>
References: <20190918092920.21435-1-patrick.delaunay@st.com>
 <b3874e83-e983-2adb-aef4-585acc4e08d9@denx.de>
 <20190920190324.GM1011@bill-the-cat> 
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-01_04:2019-09-30,2019-10-01 signatures=0
Cc: Hamish Guthrie <hamish.guthrie@kistler.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Eugeniu Rosca <roscaeugeniu@gmail.com>, Michal Simek <michal.simek@xilinx.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>, Ash Charles <ash@gumstix.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, U-Boot
 STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Ruslan Trofymenko <ruslan.trofymenko@linaro.org>
Subject: Re: [Uboot-stm32] [U-Boot] [PATCH v3 0/3] env: Add
	CONFIG_ENV_FULL_SUPPORT
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

Hi Tom and Wolfgang,

> From: Patrick DELAUNAY
> Sent: jeudi 26 septembre 2019 11:58
> 
> Hi Tom,
> 
> > From: Tom Rini <trini@konsulko.com>
> > Sent: vendredi 20 septembre 2019 21:03
> >
> > On Fri, Sep 20, 2019 at 11:09:14AM +0200, Stefan Roese wrote:
> > > Hi Patrick,
> > >
> > > On 18.09.19 11:29, Patrick Delaunay wrote:
> > > >This patchset is a the 3rd version of
> > > >   http://patchwork.ozlabs.org/project/uboot/list/?series=129339
> > > >   "env: Add CONFIG_ENV_SUPPORT"
> > > >
> > > >The first patch of the serie only solves the regression introduced
> > > >by commit 7d4776545b0f ("env: solve compilation error in SPL");
> > > >change_ok was always NULL in U-Boot.
> > > >See "U-Boot: Environment flags broken for U-Boot" mail
> > > >http://u-boot.10912.n7.nabble.com/U-Boot-Environment-flags-broken-f
> > > >or
> > > >-U-Boot-tt382673.html
> > > >
> > > >This first patch can be integrated in master branch for v2019.10 as
> > > >requested Tom Rimi.
> > > >
> > > >The next patches of the serie is a proposal after Wolfgang Denk
> > > >review on the first proposal: I make the env support coherent
> > > >between U-Boot, SPL and TPL.
> > > >
> > > >I need to change many defconfig (to add
> > > >CONFIG_(SPL/TPL)_ENV_IS_NOWHERE) because I modify the
> dependency
> > between the CONFIG used by SPL.
> > > >
> > > >Moreover the size of SPL increase after this last patch.
> > > >
> > > >For example on stm32mp15_basic, the SPL sizes:
> > > >
> > > >   62024	   4616	    892	  67532	  107cc	spl/u-boot-spl 00003e6c
> > > >
> > > >increase by 250 byte to
> > > >
> > > >   62274	   4640	    896	  67810	  108e2	spl/u-boot-spl 00003f56
> > > >
> > > >And the patch also breaks the compilation of few boards, when SPL
> > > >size is near to its limit (.sram overflowed in SPL or SPL image too big):
> > > >  imx6q_logic (by 1572 bytes)
> > > >  omap3_logic_somlv (by 220 bytes)
> > > >  omap3_logic (by 276 bytes)
> > > >  omap35_logic_somlv (by 156 bytes)
> > > >  omap35_logic (by 3064 bytes)
> > > >  smartweb (by 408 bytes)
> > > >  duovero (by 952 bytes)
> > > >  x600 (by 1624 bytes)
> > > >
> > > >So the last patch can't be integrated today with these errors but
> > > >any review and advice are welcome.
> > >
> > > I'm looking into this because of the x600 breakage. So this patchset
> > > increases the SPL image size because all the environment "features"
> > > are now also available in SPL (please correct me if I'm wrong). In
> > > the case of x600 (IIRC), env is not used at all in the SPL stage.
> > > Perhaps it would be possible to (optionally) remove the environment
> > > support completely from SPL/TPL in such cases?
> >
> > As part of correcting things here, we need to be able to have boards
> > either:
> > - Work as-is today, whatever options that need to be on/off now, are
> >   on/off.
> > - In the potential cases of undesirable configurations we need to be
> >   able to opt for "OK, drop stuff" as well as there's going to be many
> >   cases where the board doesn't have the binary space for more features
> >   and removal of really unused stuff is fine.  ie TPL/SPL environment
> >   use cases boil down to:
> >   - Need read-only support, for network stack.
> >   - Need some read/write support, for bootcount
> >   - Maybe a few things along those lines I can't think of off-hand but
> >     are $X needs read-only or $Y needs limited write.
> 
> I think that it was already managed by Kconfig :
> 
> + not supported => only read of default env =>
> + CONFIG_SPL_ENV_IS_NOWHERE Read-only on XXX => default behavior and
> + activated when CONFIG_SPL_ENV_IS_IN_XXX is activated Write support =>
> + CONFIG_SPL_SAVEENV (deactivated by default)
> 
> (Same for CONFIG_TPL)
> 
> I just be sure that it is the correct and expected behavior before to go futher /
> cheakc why the SPL size increase on the broken board.

I come back to mys proposition and I check the reason for the SPL size increasing...

It is directly linked to default_environment[]
=> before my patch this symbol  wan't used so the associated code was removed by the linker.

After my path it is used in env_nowhere_init().

I propose to create 3 new flags to configure the default environment size:

CONFIG_ENV_DEFAULT => default = y
CONFIG_SPL_ENV_DEFAULT => default  = n
CONFIG_TPL_ENV_DEFAULT => default  = n

So the default environment will be empty for SPL/TPL, with the code:

const uchar default_environment[] = {
#if CONFIG_IS_ENABLED(ENV_DEFAULT)
...
#endif /* ENV_DEFAULT */
}

I assume the environment in SPL need to be loaded (from the last u-boot saveenv) or is empty.
Do you think this assumption is OK ?

With this patch all the board compilation are ok except smartweb (`.sram' overflowed by 56 bytes)

But I don't know how solve the issue for this bard
 
Partial compilation result :

  arm:  +   smartweb
+/local/home/frq07632/.buildman-toolchains/gcc-7.3.0-nolibc/arm-linux-gnueabi/bin/arm-linux-gnueabi-ld.bfd: u-boot-spl section `.u_boot_list' will not fit in region `.sram'
+/local/home/frq07632/.buildman-toolchains/gcc-7.3.0-nolibc/arm-linux-gnueabi/bin/arm-linux-gnueabi-ld.bfd: SPL image too big
+/local/home/frq07632/.buildman-toolchains/gcc-7.3.0-nolibc/arm-linux-gnueabi/bin/arm-linux-gnueabi-ld.bfd: region `.sram' overflowed by 56 bytes
+make[2]: *** [spl/u-boot-spl] Error 1
+make[1]: *** [spl/u-boot-spl] Error 2
       x86: (for 26/26 boards) all -23.5 bss -7.4 spl/u-boot-spl:all -226.7 spl/u-boot-spl:data +0.9 spl/u-boot-spl:rodata -228.6 spl/u-boot-spl:text +1.0 text -16.1
   aarch64: (for 225/225 boards) all +0.1 rodata +0.1 spl/u-boot-spl:all -33.3 spl/u-boot-spl:bss -0.1 spl/u-boot-spl:data +18.0 spl/u-boot-spl:rodata -64.3 spl/u-boot-spl:text +13.2
   powerpc: (for 309/309 boards) spl/u-boot-spl:all -338.8 spl/u-boot-spl:data -338.8
   sandbox: (for 6/6 boards) all -46.7 rodata +16.0 spl/u-boot-spl:all -496.0 spl/u-boot-spl:rodata -496.0 text -62.7
microblaze: (for 1/1 boards) all +4.0 bss +100.0 data -4.0 rodata -8.0 spl/u-boot-spl:all +1136.0 spl/u-boot-spl:bss -8.0 spl/u-boot-spl:data +24.0 spl/u-boot-spl:rodata +1092.0 spl/u-boot-spl:text +28.0 text -84.0
       arm: (for 689/689 boards) all -0.1 bss +0.1 rodata +0.1 spl/u-boot-spl:all -131.3 spl/u-boot-spl:data +12.9 spl/u-boot-spl:rodata -154.7 spl/u-boot-spl:text +10.5 text -0.3

Do you think I am still on the good trend with this proposal ?



Regards
Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
