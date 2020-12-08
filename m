Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7A72D30EC
	for <lists+uboot-stm32@lfdr.de>; Tue,  8 Dec 2020 18:25:23 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D020EC3FADB;
	Tue,  8 Dec 2020 17:25:22 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D3FC3C3FADA
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  8 Dec 2020 17:25:21 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0B8HMjEn032628; Tue, 8 Dec 2020 18:25:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to :
 references : cc : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=tER3U9WnDbC0DhZ/lFotxC5EGGo6uAL6ci7fZuqBAA0=;
 b=4jA60tnO8n98PzDvmCGwwtkI6wV+p+qY35T2AB2ITQjd4Ii+5hYle8j5K7XOzkSV5tsy
 xbshFRrvr3MsvPuQSGTES+OtFsZ+3WuUvr0CNvEnOIk10ilhPBZLsRBdX/8Fx0bZIqxR
 B79toBCuFRcgT3G/V5dzhSCMmv2waTIxJb0EfUfgtbDjvujJzweXCsav42s6CPBoHVtY
 I5hJFnmS4JrhjcbaCAX6eNkaIjnSGvvIOKyZY2Do7jus+2NiwOCbELBbkGKnH3jsH9A6
 cSU6VXtqCmVHCJw4hcMkBeI2ko5J3T1yIY6bk3d36F4gmzQLajq6T4Ao9GjL8f9l6Thw 8Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 359wqn6532-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Dec 2020 18:25:18 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 066D210002A;
 Tue,  8 Dec 2020 18:25:18 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F0EA522D0CD;
 Tue,  8 Dec 2020 18:25:17 +0100 (CET)
Received: from lmecxl0994.lme.st.com (10.75.127.49) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 8 Dec
 2020 18:25:17 +0100
To: <u-boot@lists.denx.de>
References: <20201201102920.84051-1-marex@denx.de>
 <20201201102920.84051-3-marex@denx.de>
 <875394241555405484677722aa0f3c05@SFHDAG2NODE3.st.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <1c569cfb-506f-f0f6-22b1-77797d9a8e54@foss.st.com>
Date: Tue, 8 Dec 2020 18:25:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <875394241555405484677722aa0f3c05@SFHDAG2NODE3.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG4NODE1.st.com (10.75.127.10) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-08_14:2020-12-08,
 2020-12-08 signatures=0
Cc: Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Patrice CHOTARD <patrice.chotard@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH 3/4] ARM: dts: stm32: Enable SDMMC3 on DH
	DRC02
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

SGkgTWFyZWssCj4gRnJvbTogTWFyZWsgVmFzdXQgPG1hcmV4QGRlbnguZGU+Cj4gU2VudDogbWFy
ZGkgMSBkw6ljZW1icmUgMjAyMCAxMToyOQo+Cj4gVGhlIERIIERSQzAyIGJvYXJkIGhhcyBhbiBv
bi1ib2FyZCBtaWNyb1NEIHNsb3QsIGFkZCBEVCBwcm9wZXJ0aWVzIHRvIGVuYWJsZSB0aGUgc2xv
dC4KPgo+IFNpZ25lZC1vZmYtYnk6IE1hcmVrIFZhc3V0IDxtYXJleEBkZW54LmRlPgo+IENjOiBQ
YXRyaWNlIENob3RhcmQgPHBhdHJpY2UuY2hvdGFyZEBzdC5jb20+Cj4gQ2M6IFBhdHJpY2sgRGVs
YXVuYXkgPHBhdHJpY2suZGVsYXVuYXlAc3QuY29tPgo+IC0tLQo+IE5PVEU6IExhcmdlIHBhcnQg
b2YgdGhpcyBzaG91bGQgYmUgaW4gdGhlIERIQ09NIFNvTSBEVCwgaG93ZXZlcgo+ICAgICAgICBh
IERUIHN5bmMgc2hvdWxkIG9ubHkgaGFwcGVuIGFmdGVyIExpbnV4IDUuMTAueSBhbmQgVS1Cb290
Cj4gICAgICAgIDIwMjEuMDEgYXJlIG91dC4KPiAtLS0KPiAgIGFyY2gvYXJtL2R0cy9zdG0zMm1w
MTV4eC1kaGNvbS1kcmMwMi5kdHMgfCAxMyArKysrKysrKysrKy0tCj4gICAxIGZpbGUgY2hhbmdl
ZCwgMTEgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9hcmNo
L2FybS9kdHMvc3RtMzJtcDE1eHgtZGhjb20tZHJjMDIuZHRzIGIvYXJjaC9hcm0vZHRzL3N0bTMy
bXAxNXh4LWRoY29tLWRyYzAyLmR0cwo+IGluZGV4IDVhMjM3YTNiN2IuLmU4NTA4YWE0ZDUgMTAw
NjQ0Cj4gLS0tIGEvYXJjaC9hcm0vZHRzL3N0bTMybXAxNXh4LWRoY29tLWRyYzAyLmR0cwo+ICsr
KyBiL2FyY2gvYXJtL2R0cy9zdG0zMm1wMTV4eC1kaGNvbS1kcmMwMi5kdHMKPiBAQCAtMTA1LDkg
KzEwNSwxOCBAQAo+ICAgCSAqIE9uIERSQzAyLCB0aGUgU29NIGRvZXMgbm90IGhhdmUgU0RJTyBX
aUZpLiBUaGUgcGlucwo+ICAgCSAqIGFyZSB1c2VkIGZvciBvbi1ib2FyZCBtaWNyb1NEIHNsb3Qg
aW5zdGVhZC4KPiAgIAkgKi8KPiAtCS9kZWxldGUtcHJvcGVydHkvYnJva2VuLWNkOwo+IC0JY2Qt
Z3Bpb3MgPSA8JmdwaW9pIDEwIChHUElPX0FDVElWRV9MT1cgfCBHUElPX1BVTExfVVApPjsKPiAr
CXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCIsICJvcGVuZHJhaW4iLCAic2xlZXAiOwo+ICsJcGlu
Y3RybC0wID0gPCZzZG1tYzNfYjRfcGluc19hPjsKPiArCXBpbmN0cmwtMSA9IDwmc2RtbWMzX2I0
X29kX3BpbnNfYT47Cj4gKwlwaW5jdHJsLTIgPSA8JnNkbW1jM19iNF9zbGVlcF9waW5zX2E+Owo+
ICsJY2QtZ3Bpb3MgPSA8JmdwaW9pIDEwIEdQSU9fQUNUSVZFX0hJR0g+Owo+ICAgCWRpc2FibGUt
d3A7Cj4gKwlzdCxuZWctZWRnZTsKPiArCWJ1cy13aWR0aCA9IDw0PjtUbzogdS1ib290QGxpc3Rz
LmRlbnguZGUKPiBDYzogTWFyZWsgVmFzdXQgPG1hcmV4QGRlbnguZGU+OyBQYXRyaWNlIENIT1RB
UkQgPHBhdHJpY2UuY2hvdGFyZEBzdC5jb20+OyBQYXRyaWNrIERFTEFVTkFZIDxwYXRyaWNrLmRl
bGF1bmF5QHN0LmNvbT4KPiBTdWJqZWN0OiBbUEFUQ0ggMi80XSBBUk06IGR0czogc3RtMzI6IERp
c2FibGUgU0RNTUMxIENLSU4gZmVlZGJhY2sgY2xvY2sKPiBJbXBvcnRhbmNlOiBIaWdoCj4KPgo+
ICsJdm1tYy1zdXBwbHkgPSA8JnYzdjM+Owo+ICsJdnFtbWMtc3VwcGx5ID0gPCZ2M3YzPjsKPiAr
CW1tYy1kZHItM18zdjsKPiArCXN0YXR1cyA9ICJva2F5IjsKPiAgIH07Cj4gICAKPiAgICZzcGkx
IHsKPiAtLQo+IDIuMjkuMgo+ClJldmlld2VkLWJ5OiBQYXRyaWNrIERlbGF1bmF5IDxwYXRyaWNr
LmRlbGF1bmF5QGZvc3Muc3QuY29tPgoKVGhhbmtzCgpQYXRyaWNrCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClVib290LXN0bTMyIG1haWxpbmcgbGlzdApV
Ym9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==
