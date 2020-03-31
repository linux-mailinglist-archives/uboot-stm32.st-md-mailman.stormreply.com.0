Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D91199B85
	for <lists+uboot-stm32@lfdr.de>; Tue, 31 Mar 2020 18:29:59 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4FC55C36B0A
	for <lists+uboot-stm32@lfdr.de>; Tue, 31 Mar 2020 16:29:59 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9BF42C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Mar 2020 16:29:57 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02VGSm83023021; Tue, 31 Mar 2020 18:29:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=iXHpGevTtM116Cbkbk+XnP4/sDV2Dfkt52eBLBSipEY=;
 b=Qw50fgzHO0Ah0FOv/h3Wjt64VE5B6de5ytfEz+YC2sHQhIMNsdnYH+Sl8T8w14gEVbZl
 cUnZrz7n8v6+nltfv4pZLpk5yzd2UUG6dfygwLegcUn0W/SL1ugaotjTg2MGHybfH5xn
 0GbCbJBby8s7eXglhMcRrc62Yu9I0G70zdgOECXGkJo59+6rvEgBvgyerEIqkM4tRbAy
 49aywGW+aRr1afSABqe34RI5nBi1QEIRwv8kMGZVRnOprD1zhHWq/h1u7euIv0QNLqi+
 u6Vi+ADoWv2LjckAzjjp83eGcySkn1w13egoZ2GZ4l8S4BPviEub+CPK6WbfZkmb42QC QA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 302y53t974-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 31 Mar 2020 18:29:54 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0E82E10002A;
 Tue, 31 Mar 2020 18:29:54 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 00A1E2BF9BE;
 Tue, 31 Mar 2020 18:29:53 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 31 Mar
 2020 18:29:53 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 31 Mar 2020 18:29:53 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Simon Glass <sjg@chromium.org>, Marek Vasut <marex@denx.de>
Thread-Topic: [U-Boot] [PATCH v1 2/2] gpio: stm32f7: Fix SPL code size
Thread-Index: AQHWBwdRcCpZKJ9cmUi4E+mKBccPVahivYeAgAAkf1A=
Date: Tue, 31 Mar 2020 16:29:53 +0000
Message-ID: <5b440af5aea94fdbb5181104c069eecd@SFHDAG6NODE3.st.com>
References: <1546595706-31360-1-git-send-email-patrice.chotard@st.com>
 <1546595706-31360-3-git-send-email-patrice.chotard@st.com>
 <f3e23915-c6ae-7c4d-7c5a-f725f726b5d4@denx.de>
 <CAPnjgZ3m_Ft+uoY4RnFCQN2Ug77WbXWr1fwTOiZ7heoAdeNeMA@mail.gmail.com>
In-Reply-To: <CAPnjgZ3m_Ft+uoY4RnFCQN2Ug77WbXWr1fwTOiZ7heoAdeNeMA@mail.gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-03-31_05:2020-03-31,
 2020-03-31 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Patrice CHOTARD <patrice.chotard@st.com>
Subject: Re: [Uboot-stm32] [U-Boot] [PATCH v1 2/2] gpio: stm32f7: Fix SPL
	code size
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

Hi Simon and Marek,

> From: Simon Glass <sjg@chromium.org>
> Sent: mardi 31 mars 2020 18:08
> 
> Hi,
> 
> On Mon, 30 Mar 2020 at 20:51, Marek Vasut <marex@denx.de> wrote:
> >
> > On 1/4/19 10:55 AM, Patrice Chotard wrote:
> >
> > Hi,
> >
> > > @@ -215,7 +220,9 @@ U_BOOT_DRIVER(gpio_stm32) = {
> > >       .id     = UCLASS_GPIO,
> > >       .of_match = stm32_gpio_ids,
> > >       .probe  = gpio_stm32_probe,
> > > +#ifndef CONFIG_SPL_BUILD
> > >       .ops    = &gpio_stm32_ops,
> > > +#endif
> > >       .flags  = DM_UC_FLAG_SEQ_ALIAS,
> > >       .priv_auto_alloc_size   = sizeof(struct stm32_gpio_priv),
> > >  };
> >
> > The U-Boot DM GPIO uclass code assumes the .ops is always non-NULL.
> > Hence, this patch breaks all GPIO access (actually crashes SPL) on
> > STM32 in SPL.
> 
> Right. You are not allowed to have a driver without operations unless the uclass
> defines none.

Agree,

it was a dirty patch to reduce the SPL size for one MCU board stm32f7...
It is no more needed today: all MCU board compile without this patch.

Moreover, this patch can cause issues for stm32mp1 (crashes).

For example on STM32MP157-EV1, when SD card detect is added
in device tree, this opt is required (and it should be the case after the next
device tree allignment).

A patch to reactivate this opts was in my backlog to prepare this DT update,

I sent it today to solve the issue:
"[13/16] gpio: stm32: support gpio ops in SPL"
http://patchwork.ozlabs.org/patch/1264836/

regards

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
