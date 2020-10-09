Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B63288D58
	for <lists+uboot-stm32@lfdr.de>; Fri,  9 Oct 2020 17:53:37 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 097FCC32EA7
	for <lists+uboot-stm32@lfdr.de>; Fri,  9 Oct 2020 15:53:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AFD43C32EA3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Oct 2020 15:53:34 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 099FqR4S030041; Fri, 9 Oct 2020 17:53:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=9DbVuPji4l/rE8eVgOSnbr7CKcq5Rk0yUiqF4Xz6/Xk=;
 b=p4G9o7z/+l1C5hkF0fLJR1BHCd8+UEj3louW3UQp98WYTKHFcTuJlcgP5/44Qtq9oquB
 frOj+DcD2gALFuPP6SkjcVRFasHk+/B7IsO64v5cKmsswF1W7f+COdidAcJRbyRGJXRk
 kQwGD03gC/EH5LU0Q7jUQxX1kqV+b9FNERFEhhB5OBEtgvjmeRyF+nd5QqzUFtorZsni
 p8iBaPt+3eEDFmsh9UFUHEqKXxcEg5r1UqCc3V28XbDV9x4ZL8QsWpU6BxtoFj57eQT7
 GtIGELQlGWecfOGaHrcm/JocLGgJ/eSRwenByavDOTm9oGli+5QtdeT+Ox3lKqTBChWx 1g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3429j6wrf9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Oct 2020 17:53:01 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 72DF410002A;
 Fri,  9 Oct 2020 17:52:57 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node1.st.com [10.75.127.4])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 40A872B23FF;
 Fri,  9 Oct 2020 17:52:57 +0200 (CEST)
Received: from SFHDAG2NODE3.st.com (10.75.127.6) by SFHDAG2NODE1.st.com
 (10.75.127.4) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 9 Oct
 2020 17:52:56 +0200
Received: from SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c]) by
 SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c%20]) with mapi id
 15.00.1473.003; Fri, 9 Oct 2020 17:52:56 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>, Ard Biesheuvel <ardb@kernel.org>
Thread-Topic: [Uboot-stm32] [PATCH 0/7] arm: cache: cp15: don't map reserved
 region with no-map property
Thread-Index: AQHWm/7ac4z1MnZQC0SdlnxnUjIJ4amLzyQAgAAP6YCAA0lOIA==
Date: Fri, 9 Oct 2020 15:52:56 +0000
Message-ID: <31d9c120b2894c3b9ac6160e87306cc1@SFHDAG2NODE3.st.com>
References: <20201006163602.21687-1-patrick.delaunay@st.com>
 <CAMj1kXET8=ERg7gGqWa-FwLZzAuztBsVMhyTGmYEMAxzb63_sw@mail.gmail.com>
 <190d019a-7e18-b4bc-9276-e14bbe4c2855@pengutronix.de>
In-Reply-To: <190d019a-7e18-b4bc-9276-e14bbe4c2855@pengutronix.de>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-09_08:2020-10-09,
 2020-10-09 signatures=0
Cc: chenshuo <chenshuo@eswin.com>, Lokesh Vutla <lokeshvutla@ti.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 "marek.bykowski@gmail.com" <marek.bykowski@gmail.com>,
 Stefan Roese <sr@denx.de>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Vladimir Olovyannikov <vladimir.olovyannikov@broadcom.com>,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 Masahiro Yamada <masahiroy@kernel.org>, Rajesh Ravi <rajesh.ravi@broadcom.com>,
 Thirupathaiah Annapureddy <thiruan@linux.microsoft.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Etienne
 Carriere <etienne.carriere@linaro.org>, U-Boot
 Mailing List <u-boot@lists.denx.de>, Simon Glass <sjg@chromium.org>, Tero
 Kristo <t-kristo@ti.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Bin Meng <bmeng.cn@gmail.com>, =?utf-8?B?UGFsaSBSb2jDoXI=?= <pali@kernel.org>
Subject: Re: [Uboot-stm32] [PATCH 0/7] arm: cache: cp15: don't map reserved
 region with no-map property
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

Hi Ahmad,

> From: Ahmad Fatoum <a.fatoum@pengutronix.de>
> Sent: mercredi 7 octobre 2020 13:24
> 
> Hello Ard, Patrick,
> 
> On 10/7/20 12:26 PM, Ard Biesheuvel wrote:
> >> The issue is solved only when the region reserved by OP-TEE is no
> >> more mapped in U-Boot (mapped as DEVICE/NON-CACHEABLE wasn't
> enough)
> >> as it is already done in Linux kernel.
> >>
> >
> > Spurious peculative accesses to device regions would be a severe
> > silicon bug, so I wonder what is going on here.
> >
> > (Apologies if we are rehashing stuff here that has already been
> > discussed - I don't remember the details)
> >
> > Are you sure that the speculative accesses were not caused by
> > misconfigured CPU or page tables, missing TLB maintenance, etc etc?
> > Because it really does smell like a software issue not a hardware
> > issue.
> 
> I debugged a similar issue a year ago on an i.MX6 UltraLite (also a Cortex-A7)
> that turned to ultimately be caused by barebox not mapping I/O memory as non-
> executable. This led to very interesting effects.
> 
> My findings[1] back then were that U-Boot did set the eXecute Never bit only on
> OMAP, but not for other platforms.  So I could imagine this being the root cause of
> Patrick's issues as well:
> The CPU is speculatively executing from the region that the firewalled DRAM is
> mapped at.
> 
> barebox now configures XN for non-RAM before it turns on the MMU. You should
> do that as well (in ARM arch code, not only for stm32mp1). Additionally, you will
> want to XN map the region where your OP-TEE sits at.
> 
> [1]: https://community.nxp.com/thread/511925

Thanks to point me this thread.

I checked DACR behavior and CheckDomain /  CheckPermission

In my case the cortex A7 try to access to part of DDR / mapped cacheable and bufferable, protected by firewall.

So to use DACR I always need to configure the MMU with several Domain
- unsecure part of DDR as Domain 0 (DCACHE_WRITEALLOC)
- secure part of DDR as  Domain 1 (DCACHE_OFF)

For other part of MMU region, the I/O registers are mapped as register with Domain 0 (D_CACHE_OFF)

Then I can set DACR = 0x55555555
=> Client Accesses are checked against the access permission bits in the TLB entry

You ar right, the access permission is check only for domain configurated as client in DACR

But in ARM architecture

B2.4.8 Access permission checking

CheckPermission() pseudo code
Only check perms.ap is checked
And perms.xp is not checked 

But as the secure memory is mapped cacheable by secure OS, OP-TEE
I think to avoid to map the region is the ARM preconized solution
As explain in my answer to ard in [1]

[1] http://u-boot.10912.n7.nabble.com/PATCH-0-7-arm-cache-cp15-don-t-map-reserved-region-with-no-map-property-tt428715.html#a428958
 
> Cheers
> Ahmad
> 
> --
> Pengutronix e.K.                           |                             |
> Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
