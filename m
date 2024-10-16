Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BFAA9A1114
	for <lists+uboot-stm32@lfdr.de>; Wed, 16 Oct 2024 20:01:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C0998C78032;
	Wed, 16 Oct 2024 18:01:34 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8E6E5C5E2D2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Oct 2024 18:01:27 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49GFkeMp018446;
 Wed, 16 Oct 2024 20:01:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 nP/NXHa1Jev1Wz+CKtfdQVZGqpDBk2jPpwmnxag2jc0=; b=zciDodFe4sPkrB/j
 HrdbRDuejkJLkaxvf3h9Z7pfCzfacKxV9/XU/Pbxgm5NDpSpvFkOJ9B3+lGyGzFL
 FXCr6EZeLgx4bZSRJ2zDXy3ukRNm1OuNyQ+8YLUZhwFkTMGA6oA1LjWHFY/rERx6
 a3fJxmPhrVwreRm0uhJjKNgEz1Uz64+wl1Q0J0ckN1BMrOo1NbjCs+pUv52xHaaA
 vc9QHM+NpjfAlYTNgoZ0gD00hxqpoccbHRO9tShLOcj5LWbzp+bXblmu4U/70X6d
 8wI83G70XqLvpj7U8HH9uaGx5wO42B+XkIlk4PfQTD9FhZoC6D+Kr3HCiVYaGA9f
 XVPG1g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42a8mvb675-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Oct 2024 20:01:14 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 0D00B40044;
 Wed, 16 Oct 2024 20:00:19 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5E3E8267806;
 Wed, 16 Oct 2024 19:59:58 +0200 (CEST)
Received: from [10.48.86.243] (10.48.86.243) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 16 Oct
 2024 19:59:57 +0200
Message-ID: <81cabd9f-2c4b-4b1f-a15b-0830b75a3df8@foss.st.com>
Date: Wed, 16 Oct 2024 19:59:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marex@denx.de>, <u-boot@lists.denx.de>
References: <20240930192343.59359-1-marex@denx.de>
 <dc0a0638-0724-46d1-99c7-ee8b84e5541b@foss.st.com>
 <92a9153c-c948-43bb-8542-163ec245c74d@denx.de>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <92a9153c-c948-43bb-8542-163ec245c74d@denx.de>
X-Originating-IP: [10.48.86.243]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: uboot-stm32@st-md-mailman.stormreply.com, Tom Rini <trini@konsulko.com>,
 u-boot@dh-electronics.com
Subject: Re: [Uboot-stm32] [PATCH] ARM: stm32: Add script to install U-Boot
 from SD/eMMC to SPI NOR on DH STM32MP15xx DHSOM
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

SGksCgpPbiAxMC8xMi8yNCAwNTowMSwgTWFyZWsgVmFzdXQgd3JvdGU6Cj4gT24gMTAvMTEvMjQg
NTozMCBQTSwgUGF0cmljayBERUxBVU5BWSB3cm90ZToKPj4gSGksCj4KPiBIaSwKPgo+PiBPbiA5
LzMwLzI0IDIxOjIzLCBNYXJlayBWYXN1dCB3cm90ZToKPj4+IE1ha2UgdGhlIGRoX3VwZGF0ZV9z
ZF90b19zZiBzY3JpcHQgZ2VuZXJpYywgcmVuYW1lIGl0IHRvIAo+Pj4gZGhfdXBkYXRlX3NkbW1j
X3RvX3NmCj4+PiBhbmQgaW1wbGVtZW50IHR3byBzcGVjaWZpYyBkaF91cGRhdGVfc2RfdG9fc2Yg
YW5kIAo+Pj4gZGhfdXBkYXRlX2VtbWNfdG9fc2Ygc2NyaXB0cwo+Pj4gd2hpY2ggbG9hZCBVLUJv
b3QgZnJvbSBlaXRoZXIgU0Qgb3IgZU1NQyBhbmQgaW5zdGFsbCBpdCBpbnRvIFNQSSBOT1IuCj4+
Pgo+Pj4gU2lnbmVkLW9mZi1ieTogTWFyZWsgVmFzdXQgPG1hcmV4QGRlbnguZGU+Cj4+PiAtLS0K
Pj4+IENjOiBQYXRyaWNlIENob3RhcmQgPHBhdHJpY2UuY2hvdGFyZEBmb3NzLnN0LmNvbT4KPj4+
IENjOiBQYXRyaWNrIERlbGF1bmF5IDxwYXRyaWNrLmRlbGF1bmF5QGZvc3Muc3QuY29tPgo+Pj4g
Q2M6IFRvbSBSaW5pIDx0cmluaUBrb25zdWxrby5jb20+Cj4+PiBDYzogdS1ib290QGRoLWVsZWN0
cm9uaWNzLmNvbQo+Pj4gQ2M6IHUtYm9vdEBsaXN0cy5kZW54LmRlCj4+PiBDYzogdWJvb3Qtc3Rt
MzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQo+Pj4gLS0tCj4+PiDCoCBpbmNsdWRlL2Nv
bmZpZ3Mvc3RtMzJtcDE1X2RoX2Roc29tLmggfCAxNiArKysrKysrKysrKysrLS0tCj4+PiDCoCAx
IGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPj4+Cj4+PiBk
aWZmIC0tZ2l0IGEvaW5jbHVkZS9jb25maWdzL3N0bTMybXAxNV9kaF9kaHNvbS5oIGIvaW5jbHVk
ZS9jb25maWdzLyAKPj4+IHN0bTMybXAxNV9kaF9kaHNvbS5oCj4+PiBpbmRleCBkZTM5YjE5MjE5
ZC4uZmE3NTljOTM4YjMgMTAwNjQ0Cj4+PiAtLS0gYS9pbmNsdWRlL2NvbmZpZ3Mvc3RtMzJtcDE1
X2RoX2Roc29tLmgKPj4+ICsrKyBiL2luY2x1ZGUvY29uZmlncy9zdG0zMm1wMTVfZGhfZGhzb20u
aAo+Pj4gQEAgLTM4LDE2ICszOCwyNiBAQAo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgICJzZXRlbnYg
bG9hZGFkZHIxICYmICLCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4+
PiDCoMKgwqDCoMKgwqDCoMKgwqAgInNldGVudiBzYmxrY250ICYmICLCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgInNldGVudiB1
YmxrY250XDAiwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+Pj4gLcKg
wqDCoCAiZGhfdXBkYXRlX3NkX3RvX3NmPSIgLyogRXJhc2UgU1BJIE5PUiBhbmQgaW5zdGFsbCBV
LUJvb3QgZnJvbSAKPj4+IFNEICovIFwKPj4+ICvCoMKgwqAgImRoX3VwZGF0ZV9zZG1tY190b19z
Zj0iIC8qIEVyYXNlIFNQSSBOT1IgYW5kIGluc3RhbGwgVS1Cb290IAo+Pj4gZnJvbSBTRC9lTU1D
ICovIFwKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoCAic2V0ZXhwciBsb2FkYWRkcjEgJHtsb2FkYWRk
cn0gKyAweDEwMDAwMDAgJiYgIsKgwqDCoMKgwqDCoMKgIFwKPj4+IC3CoMKgwqDCoMKgwqDCoCAi
bG9hZCBtbWMgMDo0ICR7bG9hZGFkZHIxfSAvYm9vdC91LWJvb3Qtc3BsLnN0bTMyICYmICLCoMKg
wqAgXAo+Pj4gK8KgwqDCoMKgwqDCoMKgICJsb2FkICR7ZGhfdXBkYXRlX2lmYWNlfSAke2RoX3Vw
ZGF0ZV9kZXZ9ICLCoMKgwqDCoMKgwqDCoCBcCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAi
JHtsb2FkYWRkcjF9IC9ib290L3UtYm9vdC1zcGwuc3RtMzIgJiYgIsKgwqDCoCBcCj4+PiDCoMKg
wqDCoMKgwqDCoMKgwqAgImVudiBzZXQgZmlsZXNpemUxICR7ZmlsZXNpemV9ICYmICLCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIFwKPj4+IC3CoMKgwqDCoMKgwqDCoCAibG9hZCBtbWMgMDo0ICR7bG9h
ZGFkZHJ9IC9ib290L3UtYm9vdC5pdGIgJiYgIsKgwqDCoMKgwqDCoMKgIFwKPj4+ICvCoMKgwqDC
oMKgwqDCoCAibG9hZCAke2RoX3VwZGF0ZV9pZmFjZX0gJHtkaF91cGRhdGVfZGV2fSAiwqDCoMKg
wqDCoMKgwqAgXAo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgIiR7bG9hZGFkZHJ9IC9ib290
L3UtYm9vdC5pdGIgJiYgIiBcCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgInNmIHByb2JlICYmIHNm
IGVyYXNlIDAgMHgyMDAwMDAgJiYgIsKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+Pj4gwqDCoMKg
wqDCoMKgwqDCoMKgICJzZiB1cGRhdGUgJHtsb2FkYWRkcjF9IDAgJHtmaWxlc2l6ZTF9ICYmICLC
oMKgwqDCoMKgwqDCoCBcCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgInNmIHVwZGF0ZSAke2xvYWRh
ZGRyMX0gMHg0MDAwMCAke2ZpbGVzaXplMX0gJiYgIsKgwqDCoCBcCj4+PiDCoMKgwqDCoMKgwqDC
oMKgwqAgInNmIHVwZGF0ZSAke2xvYWRhZGRyfSAweDgwMDAwICR7ZmlsZXNpemV9ICYmICLCoMKg
wqDCoMKgwqDCoCBcCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgImVudiBzZXQgZmlsZXNpemUxICYm
IGVudiBzZXQgbG9hZGFkZHIxXDAiwqDCoMKgwqDCoMKgwqAgXAo+Pj4gK8KgwqDCoCAiZGhfdXBk
YXRlX3NkX3RvX3NmPSIgLyogRXJhc2UgU1BJIE5PUiBhbmQgaW5zdGFsbCBVLUJvb3QgZnJvbSAK
Pj4+IFNEICovIFwKPj4+ICvCoMKgwqDCoMKgwqDCoCAic2V0ZW52IGRoX3VwZGF0ZV9pZmFjZSBt
bWMgJiYgIsKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+Pj4gK8KgwqDCoMKgwqDCoMKgICJzZXRl
bnYgZGhfdXBkYXRlX2RldiAwOjQgJiYgIiBcCj4+PiArwqDCoMKgwqDCoMKgwqAgInJ1biBkaF91
cGRhdGVfc2RtbWNfdG9fc2ZcMCLCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+Pj4g
K8KgwqDCoCAiZGhfdXBkYXRlX2VtbWNfdG9fc2Y9IiAvKiBFcmFzZSBTUEkgTk9SIGFuZCBpbnN0
YWxsIFUtQm9vdCAKPj4+IGZyb20gZU1NQyAqLyBcCj4+PiArwqDCoMKgwqDCoMKgwqAgInNldGVu
diBkaF91cGRhdGVfaWZhY2UgbW1jICYmICLCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwKPj4+ICvC
oMKgwqDCoMKgwqDCoCAic2V0ZW52IGRoX3VwZGF0ZV9kZXYgMTo0ICYmICIgXAo+Pj4gK8KgwqDC
oMKgwqDCoMKgICJydW4gZGhfdXBkYXRlX3NkbW1jX3RvX3NmXDAiwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIFwKPj4+IMKgwqDCoMKgwqAgInN0ZGluPXNlcmlhbFwwIsKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+Pj4gwqDCoMKgwqDCoCAic3Rk
b3V0PXNlcmlhbFwwIsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgXAo+Pj4gwqDCoMKgwqDCoCAic3RkZXJyPXNlcmlhbFwwIsKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+Pj4KPj4KPj4gb2sgSSB3aWxsIG1lcmdlIGl0
IGFzIGl0Cj4+Cj4+IHdpdGggMiBtaW5vciBxdWVzdGlvbgo+Pgo+PiBhKcKgIGl0IGlzIHN0cmFu
Z2UgdG8gZGVmaW5lIGludGVyZmFjZSB2YXJpYWJsZSBmb3IgbWFjcm8KPj4gwqDCoMKgwqAgYnV0
IHVzZSBvbmx5IHdpdGggIm1tYyIgZGV2aWNlIHdpdGgKPj4KPj4+IHNldGVudiBkaF91cGRhdGVf
aWZhY2UgbW1jCj4+Cj4+IGl0IGNhbiBiZSBzaW1wbGlmaWVkIHdpdGgKPj4KPj4gImxvYWQgbW1j
ICR7ZGhfdXBkYXRlX2Rldn0KPj4KPj4gb3IgaXQgaXMgdG8gcHJlcGFyZSBvdGhlciBkZXZpY2Ug
dGhlbiAibW1jIiAuLi4uLgo+Cj4gVGhlIGxhdGVyLCBJIG5vdyBhbHNvIHJlbmFtZWQgdGhlIHNj
cmlwdCBpbiBWMiB0byBtYWtlIGl0IG1vcmUgb2J2aW91cy4KCgpvawoKCj4KPj4gYikgeW91IGFy
ZSB1c2luZyAic2YiIGNvbW1hbmQgYW5kIG5vdCAibXRkIiB0byB1ZHBhdGUgU1BJIE5PUiA/Cj4+
Cj4+Cj4+IHRoZSBNVEQgY29tbWFuZCBhbGxvd3MgdG8gdXNlIHRoZSBNVEQgcGFydGl0aW9uIG5h
bWUsIGRlZmluZWQgaW4gRFQsCj4+IHNvIG5vIG5lZWQgdG8ga25vdyBvZmZzZXQgaW4gc2NyaXB0
IChhbmQgYXZvaWQgInNmIHByb2JlIikKPj4KPj4gbXRkIGVyYXNlIGZzYmwxOyBtdGQgd3JpdGUg
ZnNibDEgJHtsb2FkYWRkcjF9IDAgJHtmaWxlc2l6ZTF9IFwKPj4gbXRkIGVyYXNlIGZzYmwyOyBt
dGQgd3JpdGUgZnNibDIgJHtsb2FkYWRkcjF9IDAgJHtmaWxlc2l6ZTF9IFwKPj4gbXRkIGVyYXNl
IHVib290OyBtdGQgd3JpdGUgdWJvb3QgJHtsb2FkYWRkcn0gMCAke2ZpbGVzaXplfQo+IENhbiB5
b3UgYWxzbyBkbyAnc2YgdXBkYXRlJyBhbGlrZSBvcGVyYXRpb24gd2l0aCAnbXRkJyBjb21tYW5k
PyBJIAo+IGRvbid0IHRoaW5rIHlvdSBjYW4uIFRoZSAnc2YgdXBkYXRlJyBvZnRlbiBkb2VzIHNp
Z25pZmljYW50bHkgc3BlZWQgdXAgCj4gdGhlIFNQSSBOT1IgdXBkYXRlIHByb2Nlc3MsIGJlY2F1
c2UgU1BJIE5PUiBlcmFzZSBvcGVyYXRpb24gaXMgdmVyeSAKPiBzbG93LCB3aGlsZSBTUEkgTk9S
IHJlYWQgb3BlcmF0aW9uIGlzIGZhc3QsIHNvIGlmIHRoZSB1cGRhdGUgY2FuIHJlYWQgCj4gYW5k
IHRoZW4gc2tpcCBtYW55IGJsb2NrcyB3aGljaCBhcmUgYWxyZWFkeSBpbiB0aGUgU1BJIE5PUiBh
bmQgZXJhc2UgCj4gYW5kIHdyaXRlIG9ubHkgdGhlIGNoYW5nZWQgYmxvY2tzLCB0aGUgdXBkYXRl
IGlzIG9mdGVuIHZlcnkgZmFzdCB0b28uCgoKR29vZCBwb2ludC4uLi4KCmFuIGltcHJvdmUgcGxh
Y2UgZm9yIE1URCBjb21tYW5kCgpJIHdpbGwgdHJ5IHRvIHByb3Bvc2Ugc29tZXRoaW5nIGZvciBt
dGQgY29tbWFuZAoKCmFuZCBmb3IgdGhlIHBhdGNoCgoKQXBwbGllZCB0byB1LWJvb3Qtc3RtL21h
c3RlciwgdGhhbmtzIQoKUmVnYXJkcwpQYXRyaWNrCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0
bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
