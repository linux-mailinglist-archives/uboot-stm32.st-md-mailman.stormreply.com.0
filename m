Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 30AB678FCE2
	for <lists+uboot-stm32@lfdr.de>; Fri,  1 Sep 2023 14:05:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D4033C6B44F;
	Fri,  1 Sep 2023 12:05:07 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F078DC6B44E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  1 Sep 2023 12:05:06 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 381Bocia005077; Fri, 1 Sep 2023 14:05:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=+v99ALnlUe6ZYUQKOD3Ng50z461MtT4A61BM9WVUAUQ=; b=6K
 xeLcRnvoRx2S2IG/DuhNPesuVGSWe59PZWyhRGW11wYFnk7yQSWDXSy20HwvETa9
 XbMthwdhgCMx5CtCW8zhy/zvf266wwtUK75vH3amfSson782YLsUvdLA/4eYDVg7
 JXeUXNp6+Ncgt7Q401FGA0HvkR4ROBOuLyRCxvolxm3lSr+JRngj2pmQ/S5G9wQg
 5Q4Y33R45emQVEccMhicupX/zowTh4RhU7tcjKIef3+3ajNcbgDfwyeoZstLWG6r
 3h1NDFsN+mp9LVJTPyV7Mo9GHpDBe/rccI+tsvQzskK6FDTW4o5XPYk4K510wy3C
 DVjR3baYqdDsEB8GasnQ==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3sqvbhradf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 Sep 2023 14:05:05 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CBC0D100058;
 Fri,  1 Sep 2023 14:05:04 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A250D2291BB;
 Fri,  1 Sep 2023 14:05:04 +0200 (CEST)
Received: from [10.201.22.39] (10.201.22.39) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Fri, 1 Sep
 2023 14:05:04 +0200
Message-ID: <2e1cf0cd-1d98-16fe-97e8-96604bbb009c@foss.st.com>
Date: Fri, 1 Sep 2023 14:05:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, <u-boot@lists.denx.de>
References: <20230830080150.473374-1-fabrice.gasnier@foss.st.com>
 <84041468-abf2-9b68-6701-6605f4948bf5@denx.de>
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
In-Reply-To: <84041468-abf2-9b68-6701-6605f4948bf5@denx.de>
X-Originating-IP: [10.201.22.39]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-01_10,2023-08-31_01,2023-05-22_02
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH] usb: host: ohci-generic: Make usage of
 clock/reset bulk() API
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

T24gOC8zMC8yMyAxNzoxOCwgTWFyZWsgVmFzdXQgd3JvdGU6Cj4gT24gOC8zMC8yMyAxMDowMSwg
RmFicmljZSBHYXNuaWVyIHdyb3RlOgo+PiBNYWtlIHVzYWdlIG9mIGNsb2NrIGFuZCByZXNldCBi
dWxrIEFQSSBpbiBvcmRlciB0byBzaW1wbGlmeSB0aGUgY29kZQo+Pgo+PiBTaWduZWQtb2ZmLWJ5
OiBGYWJyaWNlIEdhc25pZXIgPGZhYnJpY2UuZ2FzbmllckBmb3NzLnN0LmNvbT4KPj4gLS0tCj4+
Cj4+IMKgIGRyaXZlcnMvdXNiL2hvc3Qvb2hjaS1nZW5lcmljLmMgfCA5MiArKysrKysrKysrKy0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0KPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDI5IGluc2VydGlvbnMo
KyksIDYzIGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvaG9zdC9v
aGNpLWdlbmVyaWMuYwo+PiBiL2RyaXZlcnMvdXNiL2hvc3Qvb2hjaS1nZW5lcmljLmMKPj4gaW5k
ZXggMmQ4ZDM4Y2U5YTQwLi45NWFhNjA4ZDhjMTkgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvdXNi
L2hvc3Qvb2hjaS1nZW5lcmljLmMKPj4gKysrIGIvZHJpdmVycy91c2IvaG9zdC9vaGNpLWdlbmVy
aWMuYwo+PiBAQCAtMTYsNzUgKzE2LDQxIEBACj4+IMKgIMKgIHN0cnVjdCBnZW5lcmljX29oY2kg
ewo+PiDCoMKgwqDCoMKgIG9oY2lfdCBvaGNpOwo+PiAtwqDCoMKgIHN0cnVjdCBjbGsgKmNsb2Nr
czvCoMKgwqAgLyogY2xvY2sgbGlzdCAqLwo+PiAtwqDCoMKgIHN0cnVjdCByZXNldF9jdGwgKnJl
c2V0czsgLyogcmVzZXQgbGlzdCAqLwo+PiArwqDCoMKgIHN0cnVjdCBjbGtfYnVsayBjbG9ja3M7
wqDCoMKgIC8qIGNsb2NrIGxpc3QgKi8KPj4gK8KgwqDCoCBzdHJ1Y3QgcmVzZXRfY3RsX2J1bGsg
cmVzZXRzOyAvKiByZXNldCBsaXN0ICovCj4+IMKgwqDCoMKgwqAgc3RydWN0IHBoeSBwaHk7Cj4+
IC3CoMKgwqAgaW50IGNsb2NrX2NvdW50O8KgwqDCoCAvKiBudW1iZXIgb2YgY2xvY2sgaW4gY2xv
Y2sgbGlzdCAqLwo+PiAtwqDCoMKgIGludCByZXNldF9jb3VudDvCoMKgwqAgLyogbnVtYmVyIG9m
IHJlc2V0IGluIHJlc2V0IGxpc3QgKi8KPj4gwqAgfTsKPj4gwqAgwqAgc3RhdGljIGludCBvaGNp
X3VzYl9wcm9iZShzdHJ1Y3QgdWRldmljZSAqZGV2KQo+PiDCoCB7Cj4+IMKgwqDCoMKgwqAgc3Ry
dWN0IG9oY2lfcmVncyAqcmVncyA9IGRldl9yZWFkX2FkZHJfcHRyKGRldik7Cj4+IMKgwqDCoMKg
wqAgc3RydWN0IGdlbmVyaWNfb2hjaSAqcHJpdiA9IGRldl9nZXRfcHJpdihkZXYpOwo+PiAtwqDC
oMKgIGludCBpLCBlcnIsIHJldCwgY2xvY2tfbmIsIHJlc2V0X25iOwo+PiAtCj4+IC3CoMKgwqAg
ZXJyID0gMDsKPj4gLcKgwqDCoCBwcml2LT5jbG9ja19jb3VudCA9IDA7Cj4+IC3CoMKgwqAgY2xv
Y2tfbmIgPSBkZXZfY291bnRfcGhhbmRsZV93aXRoX2FyZ3MoZGV2LCAiY2xvY2tzIiwKPj4gIiNj
bG9jay1jZWxscyIsCj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIDApOwo+PiAtwqDCoMKgIGlmIChjbG9ja19uYiA+IDApIHsKPj4gLcKgwqDC
oMKgwqDCoMKgIHByaXYtPmNsb2NrcyA9IGRldm1fa2NhbGxvYyhkZXYsIGNsb2NrX25iLCBzaXpl
b2Yoc3RydWN0IGNsayksCj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIEdGUF9LRVJORUwpOwo+PiAtwqDCoMKgwqDCoMKgwqAgaWYgKCFwcml2LT5jbG9j
a3MpCj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAtRU5PTUVNOwo+PiAtCj4+IC3C
oMKgwqDCoMKgwqDCoCBmb3IgKGkgPSAwOyBpIDwgY2xvY2tfbmI7IGkrKykgewo+PiAtwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBlcnIgPSBjbGtfZ2V0X2J5X2luZGV4KGRldiwgaSwgJnByaXYtPmNs
b2Nrc1tpXSk7Cj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChlcnIgPCAwKQo+PiAtwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJyZWFrOwo+PiAtCj4+IC3CoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGVyciA9IGNsa19lbmFibGUoJnByaXYtPmNsb2Nrc1tpXSk7Cj4+IC3CoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGlmIChlcnIgJiYgZXJyICE9IC1FTk9TWVMpIHsKPj4gLcKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkZXZfZXJyKGRldiwgImZhaWxlZCB0byBlbmFibGUgY2xv
Y2sgJWRcbiIsIGkpOwo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNsa19mcmVl
KCZwcml2LT5jbG9ja3NbaV0pOwo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGdv
dG8gY2xrX2VycjsKPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfQo+PiAtwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBwcml2LT5jbG9ja19jb3VudCsrOwo+PiAtwqDCoMKgwqDCoMKgwqAgfQo+PiAt
wqDCoMKgIH0gZWxzZSBpZiAoY2xvY2tfbmIgIT0gLUVOT0VOVCkgewo+PiAtwqDCoMKgwqDCoMKg
wqAgZGV2X2VycihkZXYsICJmYWlsZWQgdG8gZ2V0IGNsb2NrIHBoYW5kbGUoJWQpXG4iLCBjbG9j
a19uYik7Cj4+IC3CoMKgwqDCoMKgwqDCoCByZXR1cm4gY2xvY2tfbmI7Cj4+ICvCoMKgwqAgaW50
IGVyciwgcmV0Owo+PiArCj4+ICvCoMKgwqAgcmV0ID0gY2xrX2dldF9idWxrKGRldiwgJnByaXYt
PmNsb2Nrcyk7Cj4+ICvCoMKgwqAgaWYgKHJldCAmJiByZXQgIT0gLUVOT0VOVCkgewo+PiArwqDC
oMKgwqDCoMKgwqAgZGV2X2VycihkZXYsICJGYWlsZWQgdG8gZ2V0IGNsb2NrcyAocmV0PSVkKVxu
IiwgcmV0KTsKPiAKPiBQbHVyYWwgb2YgJ2Nsb2NrJyBpcyBzdGlsbCAnY2xvY2snICwgcGxlYXNl
IGZpeCBqdXN0IHRoZSB0ZXh0LCBrZWVwIHRoZQo+IHZhcmlhYmxlIG5hbWUgLgoKSGkgTWFyZWss
CgpBcmUgeW91IHN1cmUgPyBUYWtpbmcgYSBjbG9zZXIgbG9vayBvbiB0aGUgd2ViLCBhbHNvIGlu
IExpbnV4IG9yIHUtYm9vdCwKSSBjYW4gc2VlIHBsdXJhbCBvZiBjbG9jayBpcyBjbG9ja3MuIERv
Y3VtZW50YXRpb24gYWxzbyBkZWFscyB3aXRoCm11bHRpcGxlIGNsb2NrcyB0b28uCgo+IAo+PiAr
wqDCoMKgwqDCoMKgwqAgcmV0dXJuIHJldDsKPj4gK8KgwqDCoCB9Cj4+ICsKPj4gK8KgwqDCoCBl
cnIgPSBjbGtfZW5hYmxlX2J1bGsoJnByaXYtPmNsb2Nrcyk7Cj4+ICvCoMKgwqAgaWYgKGVycikg
ewo+PiArwqDCoMKgwqDCoMKgwqAgZGV2X2VycihkZXYsICJGYWlsZWQgdG8gZW5hYmxlIGNsb2Nr
cyAoZXJyPSVkKVxuIiwgZXJyKTsKPiAKPiBEVFRPIGhlcmUKPiAKPj4gK8KgwqDCoMKgwqDCoMKg
IGdvdG8gY2xrX2VycjsKPj4gwqDCoMKgwqDCoCB9Cj4+IMKgIC3CoMKgwqAgcHJpdi0+cmVzZXRf
Y291bnQgPSAwOwo+PiAtwqDCoMKgIHJlc2V0X25iID0gZGV2X2NvdW50X3BoYW5kbGVfd2l0aF9h
cmdzKGRldiwgInJlc2V0cyIsCj4+ICIjcmVzZXQtY2VsbHMiLAo+PiAtwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAwKTsKPj4gLcKgwqDCoCBpZiAo
cmVzZXRfbmIgPiAwKSB7Cj4+IC3CoMKgwqDCoMKgwqDCoCBwcml2LT5yZXNldHMgPSBkZXZtX2tj
YWxsb2MoZGV2LCByZXNldF9uYiwKPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgc2l6ZW9mKHN0cnVjdCByZXNldF9jdGwpLAo+PiAtwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBHRlBfS0VSTkVMKTsKPj4gLcKgwqDC
oMKgwqDCoMKgIGlmICghcHJpdi0+cmVzZXRzKQo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBy
ZXR1cm4gLUVOT01FTTsKPj4gLQo+PiAtwqDCoMKgwqDCoMKgwqAgZm9yIChpID0gMDsgaSA8IHJl
c2V0X25iOyBpKyspIHsKPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZXJyID0gcmVzZXRfZ2V0
X2J5X2luZGV4KGRldiwgaSwgJnByaXYtPnJlc2V0c1tpXSk7Cj4+IC3CoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGlmIChlcnIgPCAwKQo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJy
ZWFrOwo+PiAtCj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGVyciA9IHJlc2V0X2RlYXNzZXJ0
KCZwcml2LT5yZXNldHNbaV0pOwo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoZXJyKSB7
Cj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZGV2X2VycihkZXYsICJmYWlsZWQg
dG8gZGVhc3NlcnQgcmVzZXQgJWRcbiIsIGkpOwo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHJlc2V0X2ZyZWUoJnByaXYtPnJlc2V0c1tpXSk7Cj4+IC3CoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgZ290byByZXNldF9lcnI7Cj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IH0KPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcHJpdi0+cmVzZXRfY291bnQrKzsKPj4gLcKg
wqDCoMKgwqDCoMKgIH0KPj4gLcKgwqDCoCB9IGVsc2UgaWYgKHJlc2V0X25iICE9IC1FTk9FTlQp
IHsKPj4gLcKgwqDCoMKgwqDCoMKgIGRldl9lcnIoZGV2LCAiZmFpbGVkIHRvIGdldCByZXNldCBw
aGFuZGxlKCVkKVxuIiwgcmVzZXRfbmIpOwo+PiArwqDCoMKgIGVyciA9IHJlc2V0X2dldF9idWxr
KGRldiwgJnByaXYtPnJlc2V0cyk7Cj4+ICvCoMKgwqAgaWYgKGVyciAmJiBlcnIgIT0gLUVOT0VO
VCkgewo+PiArwqDCoMKgwqDCoMKgwqAgZGV2X2VycihkZXYsICJmYWlsZWQgdG8gZ2V0IHJlc2V0
cyAoZXJyPSVkKVxuIiwgZXJyKTsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8gY2xrX2VycjsK
Pj4gwqDCoMKgwqDCoCB9Cj4+IMKgICvCoMKgwqAgZXJyID0gcmVzZXRfZGVhc3NlcnRfYnVsaygm
cHJpdi0+cmVzZXRzKTsKPj4gK8KgwqDCoCBpZiAoZXJyKSB7Cj4+ICvCoMKgwqDCoMKgwqDCoCBk
ZXZfZXJyKGRldiwgImZhaWxlZCB0byBnZXQgZGVhc3NlcnQgcmVzZXRzIChlcnI9JWQpXG4iLCBl
cnIpOwo+IAo+IERyb3AgdGhlICdnZXQnIGZyb20gdGhlIHRleHQgaGVyZSwgSSB0aGluayBpdCdz
IGNvcHktcGFzdGUgZXJyb3IuCgphY2ssIHdpbGwgdXBkYXRlIGluIHYyCgo+IAo+PiArwqDCoMKg
wqDCoMKgwqAgZ290byByZXNldF9lcnI7Cj4+ICvCoMKgwqAgfQo+PiArCj4+IMKgwqDCoMKgwqAg
ZXJyID0gZ2VuZXJpY19zZXR1cF9waHkoZGV2LCAmcHJpdi0+cGh5LCAwKTsKPj4gwqDCoMKgwqDC
oCBpZiAoZXJyKQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byByZXNldF9lcnI7Cj4gCj4gV2l0
aCB0aGF0IGZpeGVkOgo+IAo+IFJldmlld2VkLWJ5OiBNYXJlayBWYXN1dCA8bWFyZXhAZGVueC5k
ZT4KClRoYW5rcywgd2lsbCBhZGQgaW4gdjIuCkJSLApGYWJyaWNlCgo+IAo+IE5pY2UgY2xlYW51
cCwgdGhhbmtzICEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4v
bGlzdGluZm8vdWJvb3Qtc3RtMzIK
