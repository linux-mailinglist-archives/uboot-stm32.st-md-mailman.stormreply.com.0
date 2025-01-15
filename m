Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E11A11E3E
	for <lists+uboot-stm32@lfdr.de>; Wed, 15 Jan 2025 10:39:15 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 80C1AC78F77;
	Wed, 15 Jan 2025 09:39:15 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 46DA6C78F74
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Jan 2025 09:39:08 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50F3w7eN007100;
 Wed, 15 Jan 2025 10:39:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 LSVrs6qM+IKY0aB7vbMLMhV6qq7CH6U/3k4F/PM0Y28=; b=RgXrYAbciOahIsVz
 Y56hYoVahkBrgVxk46PsGrHLnoN40aSzjxVg/+78/2Y7YALtKyoYYUZggAOu9lP3
 qsY59U3/oNmky17zdJMt75sBsoWFxNtdZzWRwWm54gPwBz8VBgv0CXaNLSV4RcN4
 4FZgNUUPbe21T1nsD7bO1nScCDaw7HyIkcg7J+RslZqyikBBmVNmKSNnHaPaasWu
 jXDYbiDAa5YzcTtT3GVjN6hN0xVwvhxbJFGlKTa9HRx6ZQNsiUr7G13yT73GseRA
 RbTS2B7yZhOYQ90w3iPOJ/tk9nb5m1XYb7+kfu13mtsAjMRfP+LvY4g4RiksURag
 Et8bPA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4465jns801-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Jan 2025 10:39:00 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 85C8740044;
 Wed, 15 Jan 2025 10:37:51 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6C4BB246C80;
 Wed, 15 Jan 2025 10:37:19 +0100 (CET)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 15 Jan
 2025 10:37:18 +0100
Message-ID: <a0a4a9c1-a0b2-4ad7-90e6-95c34cf89e79@foss.st.com>
Date: Wed, 15 Jan 2025 10:37:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marex@denx.de>, <u-boot@lists.denx.de>
References: <20250114144528.1612168-1-patrice.chotard@foss.st.com>
 <20250114144528.1612168-4-patrice.chotard@foss.st.com>
 <912f42f2-9358-4295-8382-8a5aa82c7804@denx.de>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <912f42f2-9358-4295-8382-8a5aa82c7804@denx.de>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-15_03,2025-01-15_02,2024-11-22_01
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Caleb Connolly <caleb.connolly@linaro.org>, Tom Rini <trini@konsulko.com>,
 Jan Kiszka <jan.kiszka@siemens.com>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH 03/10] usb: dwc3-generic: Reorder include
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

CgpPbiAxLzE0LzI1IDE1OjUxLCBNYXJlayBWYXN1dCB3cm90ZToKPiBPbiAxLzE0LzI1IDM6NDUg
UE0sIFBhdHJpY2UgQ2hvdGFyZCB3cm90ZToKPj4gUmVvcmRlciBpbmNsdWRlIGZvbGxvd2luZyBy
dWxlcyBhdmFpbGFibGUgaGVyZSA6Cj4+IGh0dHBzOi8vZG9jcy51LWJvb3Qub3JnL2VuL2xhdGVz
dC9kZXZlbG9wL2NvZGluZ3N0eWxlLmh0bWwjaW5jbHVkZS1maWxlcwo+Pgo+PiBTaWduZWQtb2Zm
LWJ5OiBQYXRyaWNlIENob3RhcmQgPHBhdHJpY2UuY2hvdGFyZEBmb3NzLnN0LmNvbT4KPj4gQ2M6
IE1hcmVrIFZhc3V0IDxtYXJleEBkZW54LmRlPgo+PiAtLS0KPj4KPj4gwqAgZHJpdmVycy91c2Iv
ZHdjMy9kd2MzLWdlbmVyaWMuYyB8IDIxICsrKysrKysrKystLS0tLS0tLS0tLQo+PiDCoCAxIGZp
bGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtZ2VuZXJpYy5jIGIvZHJpdmVycy91c2IvZHdj
My9kd2MzLWdlbmVyaWMuYwo+PiBpbmRleCAyYWI0MWNiYWU0NS4uY2I5NmUxZjM0NGYgMTAwNjQ0
Cj4+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1nZW5lcmljLmMKPj4gKysrIGIvZHJpdmVy
cy91c2IvZHdjMy9kd2MzLWdlbmVyaWMuYwo+PiBAQCAtNywyOSArNywyOCBAQAo+PiDCoMKgICog
QmFzZWQgb24gZHdjMy1vbWFwLmMuCj4+IMKgwqAgKi8KPj4gwqAgKyNpbmNsdWRlIDxjbGsuaD4K
Pj4gwqAgI2luY2x1ZGUgPGNwdV9mdW5jLmg+Cj4+IC0jaW5jbHVkZSA8bG9nLmg+Cj4+IMKgICNp
bmNsdWRlIDxkbS5oPgo+PiAtI2luY2x1ZGUgPGRtL2RldmljZS1pbnRlcm5hbC5oPgo+PiAtI2lu
Y2x1ZGUgPGRtL2xpc3RzLmg+Cj4+IMKgICNpbmNsdWRlIDxkd2MzLXVib290Lmg+Cj4+IMKgICNp
bmNsdWRlIDxnZW5lcmljLXBoeS5oPgo+PiArI2luY2x1ZGUgPGxvZy5oPgo+PiArI2luY2x1ZGUg
PG1hbGxvYy5oPgo+PiArI2luY2x1ZGUgPHJlc2V0Lmg+Cj4+ICsjaW5jbHVkZSA8dXNiLmg+Cj4+
ICsjaW5jbHVkZSA8YXNtL2dwaW8uaD4KPj4gKyNpbmNsdWRlIDxkbS9kZXZpY2UtaW50ZXJuYWwu
aD4KPj4gKyNpbmNsdWRlIDxkbS9saXN0cy5oPgo+PiDCoCAjaW5jbHVkZSA8bGludXgvYml0b3Bz
Lmg+Cj4+IMKgICNpbmNsdWRlIDxsaW51eC9kZWxheS5oPgo+PiDCoCAjaW5jbHVkZSA8bGludXgv
cHJpbnRrLmg+Cj4+IMKgICNpbmNsdWRlIDxsaW51eC91c2IvY2g5Lmg+Cj4+IMKgICNpbmNsdWRl
IDxsaW51eC91c2IvZ2FkZ2V0Lmg+Cj4+IC0jaW5jbHVkZSA8bWFsbG9jLmg+Cj4+IMKgICNpbmNs
dWRlIDxwb3dlci9yZWd1bGF0b3IuaD4KPj4gLSNpbmNsdWRlIDx1c2IuaD4KPj4gLSNpbmNsdWRl
ICJjb3JlLmgiCj4+IC0jaW5jbHVkZSAiZ2FkZ2V0LmgiCj4+IC0jaW5jbHVkZSA8cmVzZXQuaD4K
Pj4gLSNpbmNsdWRlIDxjbGsuaD4KPj4gwqAgI2luY2x1ZGUgPHVzYi94aGNpLmg+Cj4+IC0jaW5j
bHVkZSA8YXNtL2dwaW8uaD4KPiBDYW4geW91IHJlbW92ZSBzb21lIG9mIHRoZW0gdG9vID8KSGkg
TWFyZWsKCkVmZmVjdGl2ZWx5LCBzb21lIHNlZW1zIHVzZWxlc3MsIGkgd2lsbCBmaXggdGhpcyBp
biB2MgoKVGhhbmtzClBhdHJpY2UKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
L21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
