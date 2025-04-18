Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B9FA93B68
	for <lists+uboot-stm32@lfdr.de>; Fri, 18 Apr 2025 18:54:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6911FC78F71;
	Fri, 18 Apr 2025 16:54:14 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B38A8C7802C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Apr 2025 16:54:13 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53ICZZox009343;
 Fri, 18 Apr 2025 18:54:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 CAIj0J6nqrA/IhennCWmDe3NfGu2SCZojyrSNEQMNi4=; b=GdEu5NG/04yvO7v0
 uQEHbYBKidRroDCeXbV10y9ne/dI2WghJZtlokCVmscrUk7MCMPKtGwmmkWBsQXy
 o8EV4vdULxyqFSw1hR6atmpEkCL1XZoEwL6BfKewcey33CsQ+3y62NpMmvQx66Cz
 mpT/82G+1ZuRGx38TzLmCJuQx2cBwT6sCw0XEt2dFoPJL51FfDCNIZNnXIlZq2Ci
 mvKvLzTVw1ESHp2XwsA4uhaXzTpGDS3AkY4lOv2QSRQclyLzcBsM5FJ6rByXrdKp
 MxNW+NPOQF98ewS9z2gXFecJ+jBlVgCMfTQFWaCdT3Du+oMcsXcToDcd924t7NKh
 1QdkCA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46034njw5w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Apr 2025 18:54:04 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id EBE0E40051;
 Fri, 18 Apr 2025 18:53:08 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D8F17AC1775;
 Fri, 18 Apr 2025 18:44:13 +0200 (CEST)
Received: from [10.48.87.126] (10.48.87.126) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 18 Apr
 2025 18:44:13 +0200
Message-ID: <50fc39f9-8b4d-4620-a5df-3a4fa7253415@foss.st.com>
Date: Fri, 18 Apr 2025 18:44:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>
References: <20250411160326.4113545-1-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20250411160326.4113545-1-patrice.chotard@foss.st.com>
X-Originating-IP: [10.48.87.126]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-18_06,2025-04-17_01,2024-11-22_01
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Cheick Traore <cheick.traore@foss.st.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH] stm32mp: Add nvram driver
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

SGksCgpPbiA0LzExLzI1IDE4OjAzLCBQYXRyaWNlIENob3RhcmQgd3JvdGU6Cj4gRnJvbTogU2lt
ZW9uIE1hcmlqb24gPHNpbWVvbi5tYXJpam9uQGZvc3Muc3QuY29tPgo+Cj4gVEFNUCBiYWNrdXAg
cmVnaXN0ZXJzIHdpbGwgYmUgZXhwb3NlZCBhcyBudm1lbSBjZWxscy4KPgo+IEVhY2ggcmVnaXN0
ZXJzIChbMC4uMTI3XSBmb3IgU1RNMzJNUDIsIFswLi4zMV0gZm9yIFNUTTMyTVAxKSBjb3VsZCBi
ZQo+IGV4cG9zZWQgYXMgbnZtZW0gY2VsbHMgdW5kZXIgdGhlIG52cmFtIG5vZGUgaW4gZGV2aWNl
IHRyZWUKPgo+IFNpZ25lZC1vZmYtYnk6IFNpbWVvbiBNYXJpam9uIDxzaW1lb24ubWFyaWpvbkBm
b3NzLnN0LmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBQYXRyaWNlIENob3RhcmQgPHBhdHJpY2UuY2hv
dGFyZEBmb3NzLnN0LmNvbT4KPiAtLS0KPgo+ICAgYXJjaC9hcm0vbWFjaC1zdG0zMm1wL0tjb25m
aWcgIHwgICA5ICsKPiAgIGFyY2gvYXJtL21hY2gtc3RtMzJtcC9NYWtlZmlsZSB8ICAgMiArCj4g
ICBhcmNoL2FybS9tYWNoLXN0bTMybXAvbnZyYW0uYyAgfCA2NjQgKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrCj4gICAzIGZpbGVzIGNoYW5nZWQsIDY3NSBpbnNlcnRpb25zKCspCj4g
ICBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9hcm0vbWFjaC1zdG0zMm1wL252cmFtLmMKPgo+IGRp
ZmYgLS1naXQgYS9hcmNoL2FybS9tYWNoLXN0bTMybXAvS2NvbmZpZyBiL2FyY2gvYXJtL21hY2gt
c3RtMzJtcC9LY29uZmlnCj4gaW5kZXggMDAyZGEyZTNkM2IuLmQ3MzIzNjU5ODExIDEwMDY0NAo+
IC0tLSBhL2FyY2gvYXJtL21hY2gtc3RtMzJtcC9LY29uZmlnCj4gKysrIGIvYXJjaC9hcm0vbWFj
aC1zdG0zMm1wL0tjb25maWcKPiBAQCAtMTQ0LDYgKzE0NCwxNSBAQCBjb25maWcgU1RNMzJfRUNE
U0FfVkVSSUZZCj4gICAJICBST00gQVBJIHByb3ZpZGVkIG9uIFNUTTMyTVAuCj4gICAJICBUaGUg
Uk9NIEFQSSBpcyBvbmx5IGF2YWlsYWJsZSBkdXJpbmcgU1BMIGZvciBub3cuCj4gICAKPiArY29u
ZmlnIFNUTTMyTVBfVEFNUF9OVk1FTQo+ICsJYm9vbCAiU1RNMzIgVEFNUCBiYWNrdXAgcmVnaXN0
ZXJzIHZpYSBOVk1FTSBBUEkiCj4gKwlzZWxlY3QgTlZNRU0KPiArCWRlZmF1bHQgeQo+ICsJaGVs
cAo+ICsJICBTYXkgeSB0byBlbmFibGUgdGhlIHVjbGFzcyBkcml2ZXIgZm9yIFRBTVAgQmFja3Vw
IHJlZ2lzdGVycyB1c2luZyB0aGUKPiArCSAgTlZNRU0gQVBJLiBJdCBhbGxvd3MgdG8gYWNjZXNz
IHRvIGJvb3QgbW9kZSBvciBvdGhlcnMgc2hhcmVkIGluZm9ybWF0aW9uCj4gKwkgIGJldHdlZW4g
c29mdHdhcmUgY29tcG9uZW50cy9leGVjdXRpb24gbGV2ZWxzLgo+ICsKPiAgIGNvbmZpZyBDTURf
U1RNMzJLRVkKPiAgIAlib29sICJjb21tYW5kIHN0bTMya2V5IHRvIGZ1c2UgcHVibGljIGtleSBo
YXNoIgo+ICAgCWRlcGVuZHMgb24gQ01ETElORQo+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9tYWNo
LXN0bTMybXAvTWFrZWZpbGUgYi9hcmNoL2FybS9tYWNoLXN0bTMybXAvTWFrZWZpbGUKPiBpbmRl
eCAxMDNlMzQxMGFkOS4uYmMwZmU5ZTIyMjUgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9hcm0vbWFjaC1z
dG0zMm1wL01ha2VmaWxlCj4gKysrIGIvYXJjaC9hcm0vbWFjaC1zdG0zMm1wL01ha2VmaWxlCj4g
QEAgLTEzLDYgKzEzLDggQEAgb2JqLSQoQ09ORklHX1NUTTMyTVAxM1gpICs9IHN0bTMybXAxLwo+
ICAgb2JqLSQoQ09ORklHX1NUTTMyTVAyNVgpICs9IHN0bTMybXAyLwo+ICAgCj4gICBvYmotJChD
T05GSUdfTUZEX1NUTTMyX1RJTUVSUykgKz0gdGltZXJzLm8KPiArb2JqLSQoQ09ORklHX1NUTTMy
TVBfVEFNUF9OVk1FTSkgKz0gbnZyYW0ubwoKCkkgZG9uJ3Qgc2VlwqAgcmVhc29uIHRvIGhhdmUg
cmVkdWNlIGZpbGUgbmFtZSBoZXIgPwoKZmlsZW5hbWUgaW5kaWNhdGUgb25seSB0aGUgdHlwZSBu
dnJhbSBmb3IgbnZtZW0gdXNlZCBmb3IgVEFNUCBiYWNrdXAgCnJlZ2lzdGVyLgoKCkkgcHJlZmVy
IGZpbmUgbmFtZSB3aXRoIGluZGljYXRpb24gb2YgdGhlIGRldmljZSB1c2VkLCBoZXJlIFRBTVAg
LAoKYW5kIGFsaWduZWQgd2l0aCBkcml2ZXIgbmFtZSAic3RtMzJfdGFtcF9udnJhbSIKCnNvIHJl
bmFtZSBudnJhbS5jID0+IHRhbXBfbnZyYW0uYwoKYW5kCgorb2JqLSQoQ09ORklHX1NUTTMyTVBf
VEFNUF9OVk1FTSkgKz0gdGFtcF9udnJhbS5vCgoKdGhhbmtzCgoKV2l0aCB0aGlzIG1pbm9yIHJl
bWFyawoKClJldmlld2VkLWJ5OiBQYXRyaWNrIERlbGF1bmF5IDxwYXRyaWNrLmRlbGF1bmF5QGZv
c3Muc3QuY29tPgoKVGhhbmtzClBhdHJpY2sKCgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3Rt
MzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
