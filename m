Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B89F1DB4
	for <lists+uboot-stm32@lfdr.de>; Wed,  6 Nov 2019 19:42:22 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 03AAEC36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed,  6 Nov 2019 18:42:22 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 67EF4C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 Nov 2019 18:42:20 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xA6Ic6ML016541; Wed, 6 Nov 2019 19:42:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=LjB1b5QucDb6Lv9/SX8iJtGwtb1M8Y7l2MCgBtCthwM=;
 b=DbL90q35PG7ywEyVGjPbpk+lYdD3zVSB916VmLUsKnUR6794kzTHyk+t77/obiJY0phh
 ktaXImmu6z0DqspWdA9OpjLk1RLJH+RhoZVuDIQwaQTYa5GhuLjorpn2Ur+2QUhUGL1w
 8PPFa9DyqOSZSX16tvUEqWzyeFc81gn5dGyQo/9aP/wYPpbIVkmTAxKEcD9V47Zoyya+
 cBTWm5XAtWBDUvYWHczjZGxg5Pvm/GRvFduGro7Xr8RxNcxubHBp7ohKGaT/xv37zc1V
 wkWYVcVTSfZpj4v5ZoD4ezNrRt/+G1++8U1KpupFGXzDzEus4ZVqE0V78AuCxavAhn7/ Ew== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2w41vcrg74-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Nov 2019 19:42:18 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1931A10002A;
 Wed,  6 Nov 2019 19:42:18 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag5node3.st.com [10.75.127.15])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0A9112B69E5;
 Wed,  6 Nov 2019 19:42:18 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG5NODE3.st.com
 (10.75.127.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 6 Nov
 2019 19:42:17 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Wed, 6 Nov 2019 19:42:17 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Marek Vasut <marex@denx.de>, "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [RESEND PATCH 4/5] usb: host: dwc2: add usb33d supply support
 for stm32mp1
Thread-Index: AQHVgmV74lppYfHq+k6uiQiN5b912adaqJsAgCPyYgA=
Date: Wed, 6 Nov 2019 18:42:17 +0000
Message-ID: <0128f125837149d7bb023df6f520e367@SFHDAG6NODE3.st.com>
References: <20191014080025.11245-1-patrick.delaunay@st.com>
 <20191014080025.11245-5-patrick.delaunay@st.com>
 <02a76e52-e12d-4fe5-6949-17ed2cfb55f3@denx.de>
In-Reply-To: <02a76e52-e12d-4fe5-6949-17ed2cfb55f3@denx.de>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.44]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-06_06:2019-11-06,2019-11-06 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Amelie DELAUNAY <amelie.delaunay@st.com>, Michal Suchanek <msuchanek@suse.de>,
 Sven Schwermer <sven@svenschwermer.de>
Subject: Re: [Uboot-stm32] [RESEND PATCH 4/5] usb: host: dwc2: add usb33d
 supply support for stm32mp1
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

> 
> On 10/14/19 10:00 AM, Patrick Delaunay wrote:
> > Enable the usb33d-supply on STM32MP1 SoCs (with "st,stm32mp1-hsotg"
> > compatible), it is the external VBUS and ID sensing comparators supply
> > needed to perform OTG operation.
> 
> I suspect we might need some dwc2-stm32p1.c SoC-specific driver here.
> Adding SoC-specific stuff into common driver doesn't sound right.

Yes, you are right... I perhaps  need to rework this patch.

Today I will drop this part in the V2 patchset.
I will resubmit a other patch later for this part because I need to cross-checks with Linux driver....

This stm32mp1 specific part also exist in our dwc2 kernel driver but I need to check if it can be upstreamed (modification in binding dwc2 is acceptable).

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
