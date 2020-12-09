Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E922D3E4C
	for <lists+uboot-stm32@lfdr.de>; Wed,  9 Dec 2020 10:16:44 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E5585C3FADB;
	Wed,  9 Dec 2020 09:16:43 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 165E6C32E90
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Dec 2020 09:16:42 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0B997wYk011314; Wed, 9 Dec 2020 10:16:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=V6E/W/aCjoNaVmydxDHCPYbn9bZBoXKKlFToavaUzz8=;
 b=7Ech/G6TVr14ISRw22y+G/799OgTPzloWQUuTx2c+D4QQWh+4YdRq6dAaDtZd58IxMga
 KCUXnNAuJSVVsfcAdwaDrCkEHY+UuSdTKX4iRigS/RwRiXh/LP2PK688vwo62u0Gm50v
 mg0jOvL/mJJ3U9dx/xP1TjPlSUmSkb1qOyF8WlLvebGTtrdr7eJ4lwRn7CglaFCEoctc
 PhJJdYyOtCYp68qMJRl1D5bIhXE7MO3v3AzuOny0Q+NLmOFFTV6ZW3FsgFJdWnEy/c9y
 APKR/8V79O8YQL2u5a31z4hrHFdOZJg23dhPGRRBN79JHJeyQdQICV92xGgkBUXp5mNS xw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 35agq637xd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Dec 2020 10:16:39 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6055210002A;
 Wed,  9 Dec 2020 10:16:38 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4E72523C163;
 Wed,  9 Dec 2020 10:16:38 +0100 (CET)
Received: from lmecxl0994.lme.st.com (10.75.127.47) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 9 Dec
 2020 10:16:37 +0100
To: Marek Vasut <marex@denx.de>, <u-boot@lists.denx.de>
References: <20201201102920.84051-1-marex@denx.de>
 <22668d9b2add43d5bb75f50862baf2f6@SFHDAG2NODE3.st.com>
 <01f3a78a-6cb5-560c-63e6-e0b94629e098@foss.st.com>
 <979eac17-8320-068b-9691-0353bcd57545@denx.de>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <f59204cb-7499-0193-5837-4b86a21cc459@foss.st.com>
Date: Wed, 9 Dec 2020 10:16:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <979eac17-8320-068b-9691-0353bcd57545@denx.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-09_07:2020-12-08,
 2020-12-09 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice CHOTARD <patrice.chotard@foss.st.com>
Subject: Re: [Uboot-stm32] FW: [PATCH 1/4] ARM: dts: stm32: Enable internal
 pull-ups for SDMMC1 on DHCOM SoM
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

SGkgTWFyZWssCgpPbiAxMi84LzIwIDY6MjYgUE0sIE1hcmVrIFZhc3V0IHdyb3RlOgo+IE9uIDEy
LzgvMjAgNjoyMCBQTSwgUGF0cmljayBERUxBVU5BWSB3cm90ZToKPj4gSGkgTWFyZWssCj4KPiBI
aSwKPgo+IFsuLi5dCj4KPj4gRm9yIHRoZSBzZXJpZTrCoCB0aGUgdGFyZ2V0IGlzIG5leHQgb3Ig
aXQgaXMgYSBidWdmaXggZm9yIG1hc3RlciAvIAo+PiB2MjAyMS4wMSA/Cj4KPiBUaGlzIGlzIGZv
ciAyMDIxLjAxICwgaXQgY29ycmVjdHMgYSBjb3VwbGUgb2YgcmFuZG9tIHRoaW5ncyBoZXJlIGFu
ZCAKPiB0aGVyZS4KCgpGb3IgdGhlIHNlcmllOgoKQXBwbGllZCB0byB1LWJvb3Qtc3RtL21hc3Rl
ci4KClRoYW5rcwoKUGF0cmljawoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClVib290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==
