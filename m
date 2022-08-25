Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED645A126E
	for <lists+uboot-stm32@lfdr.de>; Thu, 25 Aug 2022 15:36:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3407AC640FC;
	Thu, 25 Aug 2022 13:36:49 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 36743C03FC3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Aug 2022 13:36:48 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27PACPXa023729;
 Thu, 25 Aug 2022 15:36:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=GfbVqOpL9sCiZg1XNLCKqYx63otKju8LNYNwpFETfxg=;
 b=IVfwpwM8F8pd2kkE0Vh+0ZJ1xsauBZA3cdb1wlriQGRiVWmSa1OEs0wEOIAxiXhNqRC4
 /9VqBtaP3oraYRL6EZuIF9DHh3nLTDb4wQiivyD1Pl/LNdNIHnn1zN8ARgDxmODPKLEj
 OzAr8scuyX+g7bpVWEJpwBOYFaOj3HNg8Xq8duIq4C4NhlEz98dIeSk8KNGWQcRnSyrg
 qqc2knFQTaqSSJqqC6XN7XkZ1FZgD+hm2HY+QFh1QK8nqDRjQzhP+doXXugeYIABPPTw
 HXY84ARjfXsMRdhIqKVVHX5jF01yCCGWKewBalHEm1S1b0jQccd0H5ckb7Pyo9FHUUaT Fw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3j58m5kf92-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Aug 2022 15:36:45 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F3B07100034;
 Thu, 25 Aug 2022 15:36:37 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E7EBD22AFF5;
 Thu, 25 Aug 2022 15:36:37 +0200 (CEST)
Received: from [10.201.21.72] (10.75.127.46) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Thu, 25 Aug
 2022 15:36:37 +0200
Message-ID: <80f7f6f4-22bf-7ece-2a6e-0ae34c493cd9@foss.st.com>
Date: Thu, 25 Aug 2022 15:36:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Jorge Ramirez-Ortiz <jorge@foundries.io>, <hs@denx.de>,
 <patrick.delaunay@foss.st.com>, <oleksandr.suvorov@foundries.io>,
 <alain.volmat@foss.st.com>
References: <20220815145211.31342-1-jorge@foundries.io>
 <20220815145211.31342-2-jorge@foundries.io>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20220815145211.31342-2-jorge@foundries.io>
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-25_05,2022-08-25_01,2022-06-22_01
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de
Subject: Re: [Uboot-stm32] [PATCHv2 2/2] i2c: stm32f7: do not set the STOP
 condition on error
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

77u/K0FsYWluICh3aXRoIHRoZSBjb3JyZWN0IGVtYWlsIGFkZHJlc3MgOy0pKQoKQWxhaW4sIGNh
biB5b3UgaGF2ZSBhIGxvb2sgYSB0aGlzIHBhdGNoIGFuZCBnaXZlIHlvdXIgZmVlZGJhY2sgb24g
aXQuCgpPbiBteSBzaWRlIGkgdGVzdGVkIGl0IG9uIHN0bTMybXAxNTdjLWV2MSBhbmQgc3RtMzJt
cDE1N2MtZGsyLCBpIGRpZG4ndCBzZWUgYW55IHJlZ3Jlc3Npb24KYnV0IGkgcHJlZmVyIHRvIGdl
dCBleHBlcnQgZmVlZGJhY2sgCgpUaGFua3MKUGF0cmljZQoKT24gOC8xNS8yMiAxNjo1MiwgSm9y
Z2UgUmFtaXJlei1PcnRpeiB3cm90ZToKPiBTZW5kaW5nIHRoZSBzdG9wIGNvbmRpdGlvbiB3aXRo
b3V0IHdhaXRpbmcgZm9yIHRyYW5zZmVyIGNvbXBsZXRlCj4gaGFzIGJlZW4gZm91bmQgdG8gbG9j
ayB0aGUgYnVzIChCVVNZKSB3aGVuIE5BQ0tGIGlzIHJhaXNlZC4KPiAKPiBUZXN0ZWQgYWNjZXNz
aW5nIHRoZSBOWFAgU0UwNVggSTJDIGRldmljZS4KPiBodHRwczovL3d3dy5ueHAuY29tL2RvY3Mv
ZW4vYXBwbGljYXRpb24tbm90ZS9BTjEyMzk5LnBkZgo+IAo+IFNpZ25lZC1vZmYtYnk6IEpvcmdl
IFJhbWlyZXotT3J0aXogPGpvcmdlQGZvdW5kcmllcy5pbz4KPiBSZXZpZXdlZC1ieTogT2xla3Nh
bmRyIFN1dm9yb3YgPG9sZWtzYW5kci5zdXZvcm92QGZvdW5kcmllcy5pbz4KPiAtLS0KPiAgZHJp
dmVycy9pMmMvc3RtMzJmN19pMmMuYyB8IDggKysrKystLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDUg
aW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9p
MmMvc3RtMzJmN19pMmMuYyBiL2RyaXZlcnMvaTJjL3N0bTMyZjdfaTJjLmMKPiBpbmRleCAzYTcy
N2U2OGFjLi4xNDgyN2U1Y2VjIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvaTJjL3N0bTMyZjdfaTJj
LmMKPiArKysgYi9kcml2ZXJzL2kyYy9zdG0zMmY3X2kyYy5jCj4gQEAgLTQ4NSw5ICs0ODUsMTEg
QEAgc3RhdGljIGludCBzdG0zMl9pMmNfbWVzc2FnZV94ZmVyKHN0cnVjdCBzdG0zMl9pMmNfcHJp
diAqaTJjX3ByaXYsCj4gIAkJfQo+ICAJfQo+ICAKPiAtCS8qIEVuZCBvZiB0cmFuc2Zlciwgc2Vu
ZCBzdG9wIGNvbmRpdGlvbiAqLwo+IC0JbWFzayA9IFNUTTMyX0kyQ19DUjJfU1RPUDsKPiAtCXNl
dGJpdHNfbGUzMigmcmVncy0+Y3IyLCBtYXNrKTsKPiArCWlmICghcmV0KSB7Cj4gKwkJLyogRW5k
IG9mIHRyYW5zZmVyLCBzZW5kIHN0b3AgY29uZGl0aW9uICovCj4gKwkJbWFzayA9IFNUTTMyX0ky
Q19DUjJfU1RPUDsKPiArCQlzZXRiaXRzX2xlMzIoJnJlZ3MtPmNyMiwgbWFzayk7Cj4gKwl9Cj4g
IAo+ICAJcmV0dXJuIHN0bTMyX2kyY19jaGVja19lbmRfb2ZfbWVzc2FnZShpMmNfcHJpdik7Cj4g
IH0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qt
c3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8v
dWJvb3Qtc3RtMzIK
