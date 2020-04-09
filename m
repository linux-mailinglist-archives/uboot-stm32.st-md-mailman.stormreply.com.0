Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C66831A3993
	for <lists+uboot-stm32@lfdr.de>; Thu,  9 Apr 2020 20:10:17 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 72579C36B0A
	for <lists+uboot-stm32@lfdr.de>; Thu,  9 Apr 2020 18:10:17 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1146AC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Apr 2020 18:10:17 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 039I8eb5032245; Thu, 9 Apr 2020 20:10:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=gGBXBvi4pHEb7VcmgU4L9IxHjf9fqGUPt3gDLxP9AWM=;
 b=QmOqAh8iRR0izyJXlq4wm5ZDp+6FFD4LjehW2UIX+ykmBtqMHNoKzy6v/gCuwzx+3dIZ
 dup4cEKY+CaOcPKEP/zrcbIZT7eXSqSwTXSkA5RQBOxGNHECaAmu/3M3YmsTDkWoH1M0
 3scPV0OyTvlXzgPItG1Vk9Dw+Uq6lTkTGOmAHwIQMrLUo8ExGUM/0lZoegfAREP/TcAT
 svkh+ZyjdacWEBNA2hzG7ScNEBLiHx8Z4+exKO06DbeKicHN8oTO/yip9LmH930t4eR8
 4H3AbbbfN/jP57VuUeWK1yAFUEjaWvnxaFqscs+/Tz//ZHj11bojYsMGEF/1pMXCWTv6 TA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3091mav7b1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Apr 2020 20:10:12 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 61F5A10003D;
 Thu,  9 Apr 2020 20:10:09 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 56EE82B5C51;
 Thu,  9 Apr 2020 20:10:09 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 9 Apr
 2020 20:10:08 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 9 Apr 2020 20:10:08 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Marek Vasut <marex@denx.de>, "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH v2 2/2] arm: stm32mp: activate data cache on DDR in SPL
Thread-Index: AQHWCZnc01MgCwMvEUyj6RVNCVh9eahnyieAgAlWLuA=
Date: Thu, 9 Apr 2020 18:10:08 +0000
Message-ID: <a74ea1c21fa448f4b98bbb1089ae9b9a@SFHDAG6NODE3.st.com>
References: <20200403092537.19961-1-patrick.delaunay@st.com>
 <20200403105644.v2.2.Ib571c64a8c50fcbe386e728e38bbd320427e4efb@changeid>
 <2b133f06-e111-e709-8bdb-b01e791df284@denx.de>
In-Reply-To: <2b133f06-e111-e709-8bdb-b01e791df284@denx.de>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.48]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-09_06:2020-04-07,
 2020-04-09 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>,
 Patrice CHOTARD <patrice.chotard@st.com>
Subject: Re: [Uboot-stm32] [PATCH v2 2/2] arm: stm32mp: activate data cache
	on DDR in SPL
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

Dear Marek,

> From: Marek Vasut <marex@denx.de>
> Sent: vendredi 3 avril 2020 23:33
> 
> On 4/3/20 11:25 AM, Patrick Delaunay wrote:
> > Activate cache on DDR to improves the accesses to DDR used by SPL:
> > - CONFIG_SPL_BSS_START_ADDR
> > - CONFIG_SYS_SPL_MALLOC_START
> >
> > Cache is configured only when DDR is fully initialized, to avoid
> > speculative access and issue in get_ram_size().
> > Data cache is deactivated at the end of SPL, to flush the data cache
> > and the TLB.
> >
> > Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> > ---
> >
> > Changes in v2:
> > - new
> >

[...]

> > +void spl_board_prepare_for_boot(void) {
> > +	dcache_disable();
> > +	debug("SPL bye\n");
> > +}
> > +
> > +void spl_board_prepare_for_boot_linux(void)
> > +{
> > +	dcache_disable();
> > +	debug("SPL bye\n");
> 
> Is the debug() statement really needed ? I think the common SPL code already
> has some.

Not needed, I will drop them in V3.

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
