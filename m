Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC4A7483CE
	for <lists+uboot-stm32@lfdr.de>; Wed,  5 Jul 2023 14:10:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B71ACC6B45B;
	Wed,  5 Jul 2023 12:10:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CBC57C6B45A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Jul 2023 12:10:12 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 365Big3c011990; Wed, 5 Jul 2023 14:09:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=w233sGZh5r/KkikXcg+Z1n5cUdlMxB1vkN9r5KIcKDs=;
 b=SwCVfitBEWg0p7qAS1K+AfUKurC9c75l8KVE0dhPmnmIm57cfuWVBuNDmWhia7cLH6Ij
 vDY5kKewjr6RXQM6msx7VeAgV47Ybs3Fovm5KfBfTSLKwtBqWTBa/G/4/C850ZXthOCc
 dW4nqessPzBHcexC0wtmByd4zlebaBmgqPBlRFI89C0UrHyDWhvnlOjxMe4jSoT5GzAe
 kleFui49MdTiRzbkUYX34mpHXQav3EU0N/i7wzEeKDhv3V/niwpInv2yYQ7hCzERRPjM
 cKlpky3nZM9KBCvdcxknGRNXk8B3wZdFA6PINyeKbd/xPTGZhCAmtaZiPTKMzAlTAdF5 UQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3rn7wp053h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Jul 2023 14:09:18 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 35746100057;
 Wed,  5 Jul 2023 14:09:17 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 27C822248D9;
 Wed,  5 Jul 2023 14:09:17 +0200 (CEST)
Received: from [10.48.1.0] (10.48.1.0) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Wed, 5 Jul
 2023 14:09:16 +0200
Message-ID: <6798832b-2e55-2d40-e017-bb7c308aaf9f@foss.st.com>
Date: Wed, 5 Jul 2023 14:09:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 <u-boot@lists.denx.de>
References: <20230704173121.589620-1-dario.binacchi@amarulasolutions.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20230704173121.589620-1-dario.binacchi@amarulasolutions.com>
X-Originating-IP: [10.48.1.0]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-05_04,2023-07-05_01,2023-05-22_02
Cc: uboot-stm32@st-md-mailman.stormreply.com
Subject: Re: [Uboot-stm32] [PATCH v2] board: stm32mp1: add splash screen on
	dk2
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

SGkgRGFyaW8sCgpPbiA3LzQvMjMgMTk6MzEsIERhcmlvIEJpbmFjY2hpIHdyb3RlOgo+IERpc3Bs
YXkgdGhlIFNUTWljcm9lbGVjdHJvbmljcyBsb2dvLgo+Cj4gU2lnbmVkLW9mZi1ieTogRGFyaW8g
QmluYWNjaGkgPGRhcmlvLmJpbmFjY2hpQGFtYXJ1bGFzb2x1dGlvbnMuY29tPgo+Cj4KPiAtLS0K
Pgo+IENoYW5nZXMgaW4gdjI6Cj4gLSBtb3ZlICJzcGxhc2guaCIgYW5kICJzdF9sb2dvX2RhdGEu
aCIgaGVhZGVycyBiZWZvcmUgInN5c2Nvbi5oIiBpbiBvcmRlcgo+ICAgIHRvIGtlZXAgaW5jbHVk
ZXMgc29ydGVkIGFscGhhYmV0aWNhbGx5Lgo+IC0gcmVtb3ZlICJsb2dvIiB2YXJpYWJsZSBhbmQg
cGFzcyAiKHVsb25nKXN0bWljcm9lbGVjdHJvbmljc191Ym9vdF9sb2dvXzhiaXRfcmxlIgo+ICAg
IGRpcmVjdGx5IHRvIHRoZSBibXBfZGlzcGxheSgpIGZ1bmN0aW9uLgo+Cj4gICBib2FyZC9zdC9z
dG0zMm1wMS9zdG0zMm1wMS5jIHwgMTEgKysrKysrKysrKysKPiAgIDEgZmlsZSBjaGFuZ2VkLCAx
MSBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvYm9hcmQvc3Qvc3RtMzJtcDEvc3RtMzJt
cDEuYyBiL2JvYXJkL3N0L3N0bTMybXAxL3N0bTMybXAxLmMKPiBpbmRleCAxYTFiMTg0NGM4YzAu
LmViZDM5NDhkNTE5YyAxMDA2NDQKPiAtLS0gYS9ib2FyZC9zdC9zdG0zMm1wMS9zdG0zMm1wMS5j
Cj4gKysrIGIvYm9hcmQvc3Qvc3RtMzJtcDEvc3RtMzJtcDEuYwo+IEBAIC0zMSw4ICszMSwxMSBA
QAo+ICAgI2luY2x1ZGUgPHBoeS5oPgo+ICAgI2luY2x1ZGUgPHJlbW90ZXByb2MuaD4KPiAgICNp
bmNsdWRlIDxyZXNldC5oPgo+ICsjaW5jbHVkZSA8c3BsYXNoLmg+Cj4gKyNpbmNsdWRlIDxzdF9s
b2dvX2RhdGEuaD4KPiAgICNpbmNsdWRlIDxzeXNjb24uaD4KPiAgICNpbmNsdWRlIDx1c2IuaD4K
PiArI2luY2x1ZGUgPHZpZGVvLmg+Cj4gICAjaW5jbHVkZSA8d2F0Y2hkb2cuaD4KPiAgICNpbmNs
dWRlIDxhc20vZ2xvYmFsX2RhdGEuaD4KPiAgICNpbmNsdWRlIDxhc20vaW8uaD4KPiBAQCAtNjg0
LDYgKzY4NywxNCBAQCBpbnQgYm9hcmRfaW5pdCh2b2lkKQo+ICAgCWZ3X2ltYWdlc1swXS5md19u
YW1lID0gdSJTVE0zMk1QLUZJUCI7Cj4gICAJZndfaW1hZ2VzWzBdLmltYWdlX2luZGV4ID0gMTsK
PiAgICNlbmRpZgo+ICsKPiArCWlmIChJU19FTkFCTEVEKENPTkZJR19DTURfQk1QKSkgewo+ICsJ
CWlmIChib2FyZF9pc19zdG0zMm1wMTV4X2RrMigpKSB7Cj4gKwkJCWJtcF9kaXNwbGF5KCh1bG9u
ZylzdG1pY3JvZWxlY3Ryb25pY3NfdWJvb3RfbG9nb184Yml0X3JsZSwKPiArCQkJCSAgICBCTVBf
QUxJR05fQ0VOVEVSLCBCTVBfQUxJR05fQ0VOVEVSKTsKPiArCQl9Cj4gKwl9Cj4gKwo+ICAgCXJl
dHVybiAwOwo+ICAgfQo+ICAgCgoKSSB0aGluayAiaW5jbHVkZS9zdF9sb2dvX2RhdGEuaCIgc2hv
dWxkIGJlIG5vdCBkaXJlY3RseSB1c2VkIGZvciBTVE0zMiBNUFUKCml0IGlzIGEgb2Jzb2xldGUg
d2F5IHRvIGhhdmUgc3BsYXNoIHNjcmVlbiwgdXNlZCBieSBTVE0zMiBNQ1UgYXMgU1RNMzJGNy4K
CgpBbmQgZGlyZWN0IG1hbmFnZW1lbnQgZm9yIHNwbGFzaCBpdCBpcyBub3QgcmVhbGx5IG5lZWRl
ZCBpbiBib2FyZCBjb2RlLAoKYXMgaXQgaXMgYWxyZWFkeSBtYW5hZ2VkIGluIFZJREVPIGZyYW1l
d29yayB3aXRoIENPTkZJR19WSURFT19MT0dPCgplbmFibGVkIGJ5IGRlZmF1bHQgc2luY2UgY29t
bWl0IDg0NWQ3MWNlOTk5OTM2YWI1YWUyY2VmNDU0MmIyMjE4NTFjZGUxOTkgCigidmlkZW86IFNo
b3cgdGhlIFUtQm9vdCBsb2dvIGJ5IGRlZmF1bHQiKQoKYW5kIHdpdGggQ09ORklHX1NQTEFTSF9T
Q1JFRU4KCgpzZWUgc3RkaW9faW5pdF90YWJsZXMoKQoKIMKgID0+IHNwbGFzaF9kaXNwbGF5KCk7
CgoKcG9zaXRpb24gaXMgbWFuYWdlZCB3aXRoOgoKLSBDT05GSUdfU1BMQVNIX1NDUkVFTl9BTElH
TgoKLSB2YXJpYWJsZTogInNwbGFzaHBvcz1tLG0iCgoKQnV0IGJ5IGRlZmF1bHQgdGhlIFUtQm9v
dCBsb2dvICh5ZWxsb3cgc3VibWFyaW5lKSBpcyB1c2VkIGZvciBWSURFTyBMT0dPIAooU1BMQVNI
X0RFQ0wodV9ib290X2xvZ28pIGluIHZpZGVvIHVjbGFzcwoKb3IgZGVueCBmb3IgU1BMQVNIIGlz
IHVzZWQgaW4gdG9vbHMvTWFrZWZpbGUKCgojIEdlbmVyaWMgbG9nbwppZmVxICgkKExPR09fQk1Q
KSwpCkxPR09fQk1QPSAkKHNyY3RyZWUpLyQoc3JjKS9sb2dvcy9kZW54LmJtcAoKIyBVc2UgYm9h
cmQgbG9nbyBhbmQgZmFsbGJhY2sgdG8gdmVuZG9yCmlmbmVxICgkKHdpbGRjYXJkICQoc3JjdHJl
ZSkvJChzcmMpL2xvZ29zLyQoQk9BUkQpLmJtcCksKQpMT0dPX0JNUD0gJChzcmN0cmVlKS8kKHNy
YykvbG9nb3MvJChCT0FSRCkuYm1wCmVsc2UKaWZuZXEgKCQod2lsZGNhcmQgJChzcmN0cmVlKS8k
KHNyYykvbG9nb3MvJChWRU5ET1IpLmJtcCksKQpMT0dPX0JNUD0gJChzcmN0cmVlKS8kKHNyYykv
bG9nb3MvJChWRU5ET1IpLmJtcAplbmRpZgplbmRpZgoKClRoZSBTVE1pY3JvZWxlY3Ryb25pY3Mg
bG9nbyBpbWFnZSBjYW4gYmUgaW50ZWdyYXRlZCBpbiB0aGlzIGRpcmVjdG9yeSB3aXRoCgogwqDC
oMKgwqDCoMKgwqDCoCBWRU5ET1I9InN0IgoKIMKgwqDCoMKgwqDCoMKgwqAgQk9BUkQ9InN0bTMy
bXAxIgoKCldlIG5lZWQgdG8gYWRkIGl0IC4vdG9vbHMvbG9nb3Mvc3QuYm1wCgoKSSBjYW4gcHJv
cG9zZSBzb21ldGhpbmcsIGZvciBhbGwgU1QgYm9hcmQgU1RNMzJNUDF4LCBub3Qgb25seSBESzIK
CgpQYXRyaWNrCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9s
aXN0aW5mby91Ym9vdC1zdG0zMgo=
