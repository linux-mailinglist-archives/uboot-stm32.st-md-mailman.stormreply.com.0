Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E10176E75FF
	for <lists+uboot-stm32@lfdr.de>; Wed, 19 Apr 2023 11:09:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A5ED0C6B460;
	Wed, 19 Apr 2023 09:09:16 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 08D26C65E58
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Apr 2023 09:09:14 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33J8OHHS010085; Wed, 19 Apr 2023 11:09:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=7w8sUig+pE0+6yYV0mwik5gDMCzDKMXNEE16d2cMOyc=;
 b=RCjZ7NkigPhIfyW2zMSFLP57z9/vN8TtGuPY9S8DI4z/UzydkKKGYqc6FIMF8TJtvqT5
 s4ew6QoRyL43h+uAqaLzKa8J+lmXpvWrIwprHfbLcC6BTYZ6gOP9G2flHnfp57bBZdWN
 EYqOmSGzPP6U9Zjbil8sCnh9r2tAFi1J/pdqUlsoaNLelHS5ElhqBIDBAmIpefl6FDl7
 p2o0gW5roWgWR8xn6PHv7UtTuhCOfFqKAxz55AzoDK6pGmQUCM1cz+9x0spqK2rGJEtn
 3duQT+r/W2Hnno4VI3aHDZzFwW2HyXCCFmAPmqei/L3h833EWVBWbaM3ecrHmakHtrsn 7g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3q1rhryspf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Apr 2023 11:09:13 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 88A6910002A;
 Wed, 19 Apr 2023 11:09:12 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7E1EF2132CC;
 Wed, 19 Apr 2023 11:09:12 +0200 (CEST)
Received: from [10.201.21.26] (10.201.21.26) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Wed, 19 Apr
 2023 11:09:12 +0200
Message-ID: <3131f1a7-e48f-42ec-21db-9db74aa65f3e@foss.st.com>
Date: Wed, 19 Apr 2023 11:09:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20230403060444.224091-1-patrice.chotard@foss.st.com>
 <b3abb949-cca2-744d-017b-8715cf193cd0@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <b3abb949-cca2-744d-017b-8715cf193cd0@foss.st.com>
X-Originating-IP: [10.201.21.26]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-19_05,2023-04-18_01,2023-02-09_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [Uboot-stm32] [PATCH] spi: stm32_qspi: Remove useless struct
	stm32_qspi_flash
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

CgpPbiA0LzE3LzIzIDE3OjMyLCBQYXRyaWNrIERFTEFVTkFZIHdyb3RlOgo+IEhpLAo+IAo+IE9u
IDQvMy8yMyAwODowNCwgUGF0cmljZSBDaG90YXJkIHdyb3RlOgo+PiBDdXJyZW50bHksIGluIHN0
bTMyX3FzcGlfY2xhaW1fYnVzKCksIFFTUElfQ1IgYW5kIFFTUElfRENSIHJlZ2lzdGVycwo+PiBh
cmUgc2F2ZWQgaW4gc3RtMzJfb3NwaV9mbGFzaCBzdHJ1Y3Qgb24gZmlyc3QgZmxhc2ggbWVtb3J5
IGluaXRpYWxpemF0aW9uCj4+IGFuZCByZXN0b3JlZCBvbiBlYWNoIGZsYXNoIGFjY2Vzc2VzLgo+
Pgo+PiBBcyB0aGUgbG9naWMgb2Ygc3BpLXVjbGFzcy5jIGNoYW5nZWQgc2luY2UgJ2NvbW1pdCA3
NDEyODBlOWFjY2QKPj4gKCJzcGk6IHNwaS11Y2xhc3M6IEZpeCBzcGlfY2xhaW1fYnVzKCkgc3Bl
ZWQvbW9kZSBzZXR1cCBsb2dpYyIpJwo+PiBzZXRfc3BlZWQoKSBhbmQgc2V0X21vZGUoKSBjYWxs
YmFja3MgYXJlIGNhbGxlZCBzeXN0ZW1hdGljYWxseSB3aGVuIGJ1cwo+PiBzcGVlZCBvciBidXMg
bW9kZSBuZWVkIHRvIGJlIHVwZGF0ZWQsIFFTUElfQ1IgYW5kIFFTUElfRENSIHJlZ2lzdGVycyBh
cmUKPj4gc2V0IGFjY29yZGluZ2x5Lgo+Pgo+PiBTbyBzdG0zMl9xc3BpX2NsYWltX2J1cygpIGNh
biBiZSB1cGRhdGVkIGJ5IHJlbW92aW5nIFFTUElfQ1IgYW5kIFFTUElfRENSCj4+IHNhdmUvcmVz
dG9yZSBjb2RlIGFuZCBzdHJ1Y3Qgc3RtMzJfb3NwaV9mbGFzaCBjYW4gYmUgcmVtb3ZlZCBhcyB3
ZWxsLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBQYXRyaWNlIENob3RhcmQgPHBhdHJpY2UuY2hvdGFy
ZEBmb3NzLnN0LmNvbT4KPj4gLS0tCj4+Cj4+IMKgIGRyaXZlcnMvc3BpL3N0bTMyX3FzcGkuYyB8
IDI3ICsrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMyBp
bnNlcnRpb25zKCspLCAyNCBkZWxldGlvbnMoLSkKPj4KPiAKPiAKPiBSZXZpZXdlZC1ieTogUGF0
cmljayBEZWxhdW5heSA8cGF0cmljay5kZWxhdW5heUBmb3NzLnN0LmNvbT4KPiAKPiBUaGFua3MK
PiBQYXRyaWNrCj4gCj4gCgoKQXBwbGllZCBvbiB1LWJvb3Qtc3RtL21hc3RlciwgdGhhbmtzCgpQ
YXRyaWNlCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClVi
b290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL3Vib290LXN0bTMyCg==
