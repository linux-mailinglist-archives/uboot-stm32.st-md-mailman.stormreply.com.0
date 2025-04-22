Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B33A4A962E5
	for <lists+uboot-stm32@lfdr.de>; Tue, 22 Apr 2025 10:52:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 60318C78F68;
	Tue, 22 Apr 2025 08:52:49 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 365DFC78F67
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Apr 2025 08:52:48 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53M6W074030793;
 Tue, 22 Apr 2025 10:52:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 Ua9jG36Q8eOEYrFc/EPYIUn+t0xyBNRad82L01abdWk=; b=jqQn9fkhOQywooLh
 BHp7cjY/msQM+xSrqrK8VlD5rveQZWERVJTuTNej14SC4Qc2v3zKgZWO6A0ZcI1Z
 3+0+QeIPyiIOL7CnwZ07TbY1LAvJvL93SzGlkwOGKgs5tjkfliFharOyszcxKG/3
 VAWuDy0FWQEWh/9waFUCLUQHeS6IflCWN3UomBcoTPq4Ttu1bMQey/i644Wlej1s
 p8j49IRWOjzWT7UbQ67qHo5RPa9g6SU1gOZnFkiUhR4993icE08foC8X4ckAlhlh
 9SzOdyKMl0iZ2jXGZl/ODx919SOvjic4a2p794zx5TlWmZcgwEPLWU1iJX6cictc
 pZCNbA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 464psp6syq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Apr 2025 10:52:46 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 8F46840066;
 Tue, 22 Apr 2025 10:51:39 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 318B59D82F3;
 Tue, 22 Apr 2025 10:51:39 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 22 Apr
 2025 10:51:38 +0200
Message-ID: <c4ecfd2f-c379-40a4-9cf5-0d317009c9cb@foss.st.com>
Date: Tue, 22 Apr 2025 10:51:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20250401131413.387139-1-patrice.chotard@foss.st.com>
 <20250401131413.387139-14-patrice.chotard@foss.st.com>
 <d762c10f-e977-4972-88cd-a244502190bd@foss.st.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <d762c10f-e977-4972-88cd-a244502190bd@foss.st.com>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_04,2025-04-21_02,2024-11-22_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH 13/13] ARM: stm32mp: add RIFSC system bus
 driver for STM32MP25
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

CgpPbiA0LzIyLzI1IDEwOjQ0LCBQYXRyaWNrIERFTEFVTkFZIHdyb3RlOgo+IEhpLAo+IAo+IE9u
IDQvMS8yNSAxNToxNCwgUGF0cmljZSBDaG90YXJkIHdyb3RlOgo+PiBGcm9tOiBQYXRyaWNrIERl
bGF1bmF5IDxwYXRyaWNrLmRlbGF1bmF5QGZvc3Muc3QuY29tPgo+Pgo+PiBUaGlzIGRyaXZlciBp
cyBjaGVja2luZyB0aGUgYWNjZXNzIHJpZ2h0cyBvZiB0aGUgZGlmZmVyZW50Cj4+IHBlcmlwaGVy
YWxzIGNvbm5lY3RlZCB0byB0aGUgUklGU0MgYnVzLiBJZiBhY2Nlc3MgaXMgZGVuaWVkLAo+PiB0
aGUgYXNzb2NpYXRlZCBkZXZpY2UgaXMgbm90IGJpbmRlZC4KPj4KPj4gU2lnbmVkLW9mZi1ieTog
R2F0aWVuIENoZXZhbGxpZXIgPGdhdGllbi5jaGV2YWxsaWVyQGZvc3Muc3QuY29tPgo+PiBTaWdu
ZWQtb2ZmLWJ5OiBQYXRyaWNrIERlbGF1bmF5IDxwYXRyaWNrLmRlbGF1bmF5QGZvc3Muc3QuY29t
Pgo+PiBTaWduZWQtb2ZmLWJ5OiBQYXRyaWNlIENob3RhcmQgPHBhdHJpY2UuY2hvdGFyZEBmb3Nz
LnN0LmNvbT4KPj4KPj4gLS0tCj4+Cj4+IMKgIGFyY2gvYXJtL21hY2gtc3RtMzJtcC9pbmNsdWRl
L21hY2gvcmlmLmggfMKgIDI2ICsrCj4+IMKgIGFyY2gvYXJtL21hY2gtc3RtMzJtcC9zdG0zMm1w
Mi9NYWtlZmlsZcKgIHzCoMKgIDEgKwo+PiDCoCBhcmNoL2FybS9tYWNoLXN0bTMybXAvc3RtMzJt
cDIvcmlmc2MuY8KgwqAgfCAzNjQgKysrKysrKysrKysrKysrKysrKysrKysKPj4gwqAgMyBmaWxl
cyBjaGFuZ2VkLCAzOTEgaW5zZXJ0aW9ucygrKQo+PiDCoCBjcmVhdGUgbW9kZSAxMDA2NDQgYXJj
aC9hcm0vbWFjaC1zdG0zMm1wL2luY2x1ZGUvbWFjaC9yaWYuaAo+PiDCoCBjcmVhdGUgbW9kZSAx
MDA2NDQgYXJjaC9hcm0vbWFjaC1zdG0zMm1wL3N0bTMybXAyL3JpZnNjLmMKPj4KPj4gZGlmZiAt
LWdpdCBhL2FyY2gvYXJtL21hY2gtc3RtMzJtcC9pbmNsdWRlL21hY2gvcmlmLmggYi9hcmNoL2Fy
bS9tYWNoLXN0bTMybXAvaW5jbHVkZS9tYWNoL3JpZi5oCj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0
Cj4+IGluZGV4IDAwMDAwMDAwMDAwLi4xMGIyMjEwODEyMAo+PiAtLS0gL2Rldi9udWxsCj4+ICsr
KyBiL2FyY2gvYXJtL21hY2gtc3RtMzJtcC9pbmNsdWRlL21hY2gvcmlmLmgKPj4gQEAgLTAsMCAr
MSwyNiBAQAo+PiArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb3ItbGF0ZXIg
T1IgQlNELTMtQ2xhdXNlICovCj4+ICsvKgo+PiArICogQ29weXJpZ2h0IChDKSAyMDIzLCBTVE1p
Y3JvZWxlY3Ryb25pY3MgLSBBbGwgUmlnaHRzIFJlc2VydmVkCj4+ICsgKi8KPj4gKwo+PiArI2lm
bmRlZiBNQUNIX1JJRl9ICj4+ICsjZGVmaW5lIE1BQ0hfUklGX0gKPj4gKwo+PiArI2luY2x1ZGUg
PGxpbnV4L3R5cGVzLmg+Cj4+ICsKPj4gKy8qKgo+PiArICogc3RtMzJfcmlmc2NfY2hlY2tfYWNj
ZXNzIC0gQ2hlY2sgUklGIGFjY2Vzc2VzIGZvciBnaXZlbiBkZXZpY2Ugbm9kZQo+PiArICoKPj4g
KyAqIEBkZXZpY2Vfbm9kZcKgwqDCoMKgwqDCoMKgIE5vZGUgb2YgdGhlIGRldmljZSBmb3Igd2hp
Y2ggdGhlIGFjY2Vzc2VzIGFyZSBjaGVja2VkCj4+ICsgKi8KPj4gK2ludCBzdG0zMl9yaWZzY19j
aGVja19hY2Nlc3Mob2Zub2RlIGRldmljZV9ub2RlKTsKPj4gKwo+PiArLyoqCj4+ICsgKiBzdG0z
Ml9yaWZzY19jaGVja19hY2Nlc3MgLSBDaGVjayBSSUYgYWNjZXNzZXMgZm9yIGdpdmVuIGlkCj4+
ICsgKgo+PiArICogQGRldmljZV9ub2RlwqDCoMKgwqDCoMKgwqAgTm9kZSBvZiB0aGUgZGV2aWNl
IHRvIGdldCBhIHJlZmVyZW5jZSBvbiBSSUZTQwo+PiArICogQGlkwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBJRCBvZiB0aGUgcmVzb3VyY2UgdG8gY2hlY2sKPj4gKyAqLwo+PiAraW50IHN0bTMyX3Jp
ZnNjX2NoZWNrX2FjY2Vzc19ieV9pZChvZm5vZGUgZGV2aWNlX25vZGUsIHUzMiBpZCk7Cj4+ICsK
Pj4gKyNlbmRpZiAvKiBNQUNIX1JJRl9IKi8KPj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL21hY2gt
c3RtMzJtcC9zdG0zMm1wMi9NYWtlZmlsZSBiL2FyY2gvYXJtL21hY2gtc3RtMzJtcC9zdG0zMm1w
Mi9NYWtlZmlsZQo+PiBpbmRleCBiNTc5Y2U1YTgwMC4uNWRiZjc1ZGFhNzYgMTAwNjQ0Cj4+IC0t
LSBhL2FyY2gvYXJtL21hY2gtc3RtMzJtcC9zdG0zMm1wMi9NYWtlZmlsZQo+PiArKysgYi9hcmNo
L2FybS9tYWNoLXN0bTMybXAvc3RtMzJtcDIvTWFrZWZpbGUKPj4gQEAgLTUsNSArNSw2IEBACj4+
IMKgIMKgIG9iai15ICs9IGNwdS5vCj4+IMKgIG9iai15ICs9IGFybTY0LW1tdS5vCj4+ICtvYmot
eSArPSByaWZzYy5vCj4+IMKgIG9iai0kKENPTkZJR19PRl9TWVNURU1fU0VUVVApICs9IGZkdC5v
Cj4+IMKgIG9iai0kKENPTkZJR19TVE0zMk1QMjVYKSArPSBzdG0zMm1wMjV4Lm8KPj4gZGlmZiAt
LWdpdCBhL2FyY2gvYXJtL21hY2gtc3RtMzJtcC9zdG0zMm1wMi9yaWZzYy5jIGIvYXJjaC9hcm0v
bWFjaC1zdG0zMm1wL3N0bTMybXAyL3JpZnNjLmMKPj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPj4g
aW5kZXggMDAwMDAwMDAwMDAuLjQ4ZjY1MzY1Mzc2Cj4+IC0tLSAvZGV2L251bGwKPj4gKysrIGIv
YXJjaC9hcm0vbWFjaC1zdG0zMm1wL3N0bTMybXAyL3JpZnNjLmMKPj4gQEAgLTAsMCArMSwzNjQg
QEAKPj4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9yLWxhdGVyIE9SIEJT
RC0zLUNsYXVzZQo+PiArLyoKPj4gKyAqIENvcHlyaWdodCAoQykgMjAyMywgU1RNaWNyb2VsZWN0
cm9uaWNzIC0gQWxsIFJpZ2h0cyBSZXNlcnZlZAo+PiArICovCj4+ICsKPj4gKyNkZWZpbmUgTE9H
X0NBVEVHT1JZIFVDTEFTU19TSU1QTEVfQlVTCj4+ICsKPiAKPiAKPiBtaW5vcjoKPiAKPiAjZGVm
aW5lIExPR19DQVRFR09SWSBVQ0xBU1NfTk9QCj4gCj4gCj4gdG8gYmUgY29oZXJlbnQgd2l0aCBk
cml2ZXIKClJpZ2h0LCBpIHdpbGwgdXBkYXRlIHRoaXMuCgpUaGFua3MKUGF0cmljZQoKPiAKPiAu
Li4uCj4gCj4+ICsKPj4gK1VfQk9PVF9EUklWRVIoc3RtMzJfcmlmc2MpID0gewo+PiArwqDCoMKg
IC5uYW1lID0gInN0bTMyX3JpZnNjIiwKPj4gK8KgwqDCoCAuaWQgPSBVQ0xBU1NfTk9QLAo+PiAr
wqDCoMKgIC5vZl9tYXRjaCA9IHN0bTMyX3JpZnNjX2lkcywKPj4gK8KgwqDCoCAuYmluZCA9IHN0
bTMyX3JpZnNjX2JpbmQsCj4+ICvCoMKgwqAgLnJlbW92ZSA9IHN0bTMyX3JpZnNjX3JlbW92ZSwK
Pj4gK8KgwqDCoCAuY2hpbGRfcG9zdF9iaW5kID0gc3RtMzJfcmlmc2NfY2hpbGRfcG9zdF9iaW5k
LAo+PiArwqDCoMKgIC5jaGlsZF9wcmVfcHJvYmUgPSBzdG0zMl9yaWZzY19jaGlsZF9wcmVfcHJv
YmUsCj4+ICvCoMKgwqAgLmNoaWxkX3Bvc3RfcmVtb3ZlID0gc3RtMzJfcmlmc2NfY2hpbGRfcG9z
dF9yZW1vdmUsCj4+ICvCoMKgwqAgLnBsYXRfYXV0byA9IHNpemVvZihzdHJ1Y3Qgc3RtMzJfcmlm
c2NfcGxhdCksCj4+ICvCoMKgwqAgLnBlcl9jaGlsZF9wbGF0X2F1dG8gPSBzaXplb2Yoc3RydWN0
IHN0bTMyX3JpZnNjX2NoaWxkX3BsYXQpLAo+PiArwqDCoMKgIC5mbGFncyA9IERNX0ZMQUdfT1Nf
UFJFUEFSRSwKPj4gK307Cj4gCj4gCj4gQW55d2F5Cj4gCj4gCj4gUmV2aWV3ZWQtYnk6IFBhdHJp
Y2sgRGVsYXVuYXkgPHBhdHJpY2suZGVsYXVuYXlAZm9zcy5zdC5jb20+Cj4gCj4gVGhhbmtzCj4g
UGF0cmljawo+IAo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1h
bi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
