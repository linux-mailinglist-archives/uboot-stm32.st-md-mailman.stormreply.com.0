Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1969B3AC593
	for <lists+uboot-stm32@lfdr.de>; Fri, 18 Jun 2021 09:59:58 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D4E93C597AF;
	Fri, 18 Jun 2021 07:59:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 04D6DC597AE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Jun 2021 07:59:55 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15I7vPHC016525; Fri, 18 Jun 2021 09:59:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=zyMgVKe6YnmONtkEw6krKLuT9kcBb9JWVjxkRjRXDbY=;
 b=mOXH52QtCBV+A3KGNADddXzsTfnJHRExMKV9KOJHbVaAFIa2ppiLzDrsuaZWcPBhdMbU
 983xvg7Ns3RSkKzBYraMn/ojd/Gs45rKWETL8SmL6wEloarsgXrYXV0760gHEjyp3P3t
 qj14EpA6HtjihBh3tF0oDvwnyYTQX5U5Z3g3qgNAeoQ2Nz7uvQ+9ysxbaT4U3H7/hm+o
 WZUOHdj8xwgAcwJEtvw2WReZeKsY6FzCsDJmegVftsuXt/DRZ15oc1SYFLhm2eEsHUds
 J5IbYPaw1neB+jVQlZ0cnq3FW2uOkSx+5Vi7OnexeTg185mJrXLa82ONz6at3eqfA/p0 lw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3985b757df-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Jun 2021 09:59:53 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 24F3C10002A;
 Fri, 18 Jun 2021 09:59:53 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1237B21A20A;
 Fri, 18 Jun 2021 09:59:53 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.49) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 18 Jun
 2021 09:59:52 +0200
To: <u-boot@lists.denx.de>, Marcin Sloniewski <marcin.sloniewski@gmail.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 <uboot-stm32@st-md-mailman.stormreply.com>
References: <cover.1622651232.git.gszymaszek@short.pl>
 <908739807bd46fca81a4636bef0736a68de8c431.1622651232.git.gszymaszek@short.pl>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <1dd8d524-8390-98f2-1f81-d10787931004@foss.st.com>
Date: Fri, 18 Jun 2021 09:59:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <908739807bd46fca81a4636bef0736a68de8c431.1622651232.git.gszymaszek@short.pl>
Content-Language: en-US
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-17_17:2021-06-15,
 2021-06-17 signatures=0
Subject: Re: [Uboot-stm32] [PATCH v2 3/5] arm: dts: stm32mp157c-odyssey-som:
 set the SDMMC2 VQMMC supply
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

CgpPbiA2LzIvMjEgNzowOSBQTSwgR3J6ZWdvcnogU3p5bWFzemVrIHdyb3RlOgo+IFNldCB0aGUg
U0RNTUMyIFZRTU1DIHN1cHBseSB0byB2ZGQgKGJ1Y2szKS4gTm90ZSB0aGF0IGluIHRoZQo+IGNv
cnJlc3BvbmRpbmcgTGludXgga2VybmVsIGRldmljZSB0cmVlLCB0aGUgc3VwcGx5IGlzIHNldCB0
byB2M3YzCj4gKGJ1Y2s0KSwgd2hpY2ggaXMgd3JvbmcuCj4gCj4gU2lnbmVkLW9mZi1ieTogR3J6
ZWdvcnogU3p5bWFzemVrIDxnc3p5bWFzemVrQHNob3J0LnBsPgo+IENjOiBQYXRyaWNlIENob3Rh
cmQgPHBhdHJpY2UuY2hvdGFyZEBmb3NzLnN0LmNvbT4KPiBDYzogUGF0cmljayBEZWxhdW5heSA8
cGF0cmljay5kZWxhdW5heUBmb3NzLnN0LmNvbT4KPiBSZXZpZXdlZC1ieTogUGF0cmljZSBDaG90
YXJkIDxwYXRyaWNlLmNob3RhcmRAZm9zcy5zdC5jb20+Cj4gLS0tCj4gQ2hhbmdlcyBmb3IgdjI6
Cj4gICAgLSByZWJhc2VkIG9uIGN1cnJlbnQgbWFzdGVyIChwYXRjaCBub3QgY2hhbmdlZCkKPiAg
ICAtIGFkZGVkIFBhdHJpY2UgQ2hvdGFyZOKAmXMgUmV2aWV3ZWQtYnkKPiAKPiAgYXJjaC9hcm0v
ZHRzL3N0bTMybXAxNTdjLW9keXNzZXktc29tLmR0c2kgfCAxICsKPiAgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspCj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2R0cy9zdG0zMm1wMTU3
Yy1vZHlzc2V5LXNvbS5kdHNpIGIvYXJjaC9hcm0vZHRzL3N0bTMybXAxNTdjLW9keXNzZXktc29t
LmR0c2kKPiBpbmRleCA3MzIzMzI1ZTYwLi41ODM4MTJmMTM3IDEwMDY0NAo+IC0tLSBhL2FyY2gv
YXJtL2R0cy9zdG0zMm1wMTU3Yy1vZHlzc2V5LXNvbS5kdHNpCj4gKysrIGIvYXJjaC9hcm0vZHRz
L3N0bTMybXAxNTdjLW9keXNzZXktc29tLmR0c2kKPiBAQCAtMjczLDYgKzI3Myw3IEBACj4gIAlz
dCxuZWctZWRnZTsKPiAgCWJ1cy13aWR0aCA9IDw4PjsKPiAgCXZtbWMtc3VwcGx5ID0gPCZ2M3Yz
PjsKPiArCXZxbW1jLXN1cHBseSA9IDwmdmRkPjsKPiAgCXN0YXR1cyA9ICJva2F5IjsKPiAgfTsK
PiAgCj4gCkFwcGxpZWQgb24gdS1ib290LXN0bTMyL25leHQKClRoYW5rcwpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxp
c3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
