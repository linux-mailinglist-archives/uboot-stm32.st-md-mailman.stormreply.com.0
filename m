Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 25FC1AC506A
	for <lists+uboot-stm32@lfdr.de>; Tue, 27 May 2025 16:01:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DFE54C36B19;
	Tue, 27 May 2025 14:01:13 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ECEC0C36B17
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 May 2025 14:01:11 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RA2TNS020525;
 Tue, 27 May 2025 16:01:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 8QMgi0gE0FBaMNeI2NwsQMyJfMwFa/dBNiObpX8qq7M=; b=y7BatTaFCc00FTx4
 FQC8/C2YlxLT1R+P0ga5UhZINPu0lPTDxJDU7vDDky4xhn9ytzq8Yph+DygWK9x8
 NqWF51+OaZmQpzguNYJfcygsBIYcH9wBWtMDHHJJzXRhTt732nCLA4ieWB/j12kf
 t4CtvI/ERSrXfbFbexXyUWBim+/JrDLp5dvdjzQfpl/Aa/Vn6yV58NEeCJrBdqSp
 9QqX13U3wKbg+7/ghp4saw36jbWSdBlvtoCSxWAxoU4+B7BDL+O5JDy41S8E8LmO
 6nZPfY2i+HeYJC4p43RqgDunWUU9b8qcfBap/40c1SmauGzAoabt80JTIoaGNRmt
 le4sgA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46uqp4j9h6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 May 2025 16:01:10 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 0766A4005A;
 Tue, 27 May 2025 16:00:27 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5FC5EAFAE80;
 Tue, 27 May 2025 16:00:04 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 27 May
 2025 16:00:03 +0200
Message-ID: <2154fd75-d1e0-4673-9bbe-4200c661275c@foss.st.com>
Date: Tue, 27 May 2025 16:00:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Antonio Borneo <antonio.borneo@foss.st.com>, <u-boot@lists.denx.de>,
 Stefan Roese <sr@denx.de>, Patrick Delaunay <patrick.delaunay@foss.st.com>
References: <20250521122755.265760-1-antonio.borneo@foss.st.com>
 <20250523094658.299730-4-antonio.borneo@foss.st.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20250523094658.299730-4-antonio.borneo@foss.st.com>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_07,2025-05-27_01,2025-03-28_01
Cc: uboot-stm32@st-md-mailman.stormreply.com,
 Lionel Debieve <lionel.debieve@foss.st.com>,
 =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH v2 3/4] watchdog: stm32mp: check the
	watchdog status
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

CgpPbiA1LzIzLzI1IDExOjQ2LCBBbnRvbmlvIEJvcm5lbyB3cm90ZToKPiBGcm9tOiBDbMOpbWVu
dCBMZSBHb2ZmaWMgPGNsZW1lbnQubGVnb2ZmaWNAZm9zcy5zdC5jb20+Cj4gCj4gQWRkIGEgbWVh
biB0byBjaGVjayB0aGUgSVdERyBzdGF0dXMgYmFzZWQgb24gdGhlIHBlcmlwaGVyYWwgdmVyc2lv
bi4KPiBUaGlzIGlzIGRvbmUgYnkgZWl0aGVyIGNoZWNraW5nIHRoZSBzdGF0dXMgYml0IE9ORiBl
aXRoZXIgYnkgdXBkYXRpbmcKPiB0aGUgcmVsb2FkIHJlZ2lzdGVyIHdpdGggdGhlIHNhbWUgdmFs
dWUgYW5kIGNoZWNrIGlmIHRoZSByZWxvYWQgc3VjY2VlZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBD
bMOpbWVudCBMZSBHb2ZmaWMgPGNsZW1lbnQubGVnb2ZmaWNAZm9zcy5zdC5jb20+Cj4gU2lnbmVk
LW9mZi1ieTogQW50b25pbyBCb3JuZW8gPGFudG9uaW8uYm9ybmVvQGZvc3Muc3QuY29tPgo+IC0t
LQo+ICBkcml2ZXJzL3dhdGNoZG9nL3N0bTMybXBfd2R0LmMgfCAzMyArKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDMzIGluc2VydGlvbnMoKykKPiAK
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy93YXRjaGRvZy9zdG0zMm1wX3dkdC5jIGIvZHJpdmVycy93
YXRjaGRvZy9zdG0zMm1wX3dkdC5jCj4gaW5kZXggOTdhYjhjZmU3YWIuLjA3MTI1MjRiNGE4IDEw
MDY0NAo+IC0tLSBhL2RyaXZlcnMvd2F0Y2hkb2cvc3RtMzJtcF93ZHQuYwo+ICsrKyBiL2RyaXZl
cnMvd2F0Y2hkb2cvc3RtMzJtcF93ZHQuYwo+IEBAIC0yMSwxMSArMjEsMTMgQEAKPiAgI2RlZmlu
ZSBJV0RHX1BSCQkweDA0CS8qIFByZXNjYWxlciBSZWdpc3RlciAqLwo+ICAjZGVmaW5lIElXREdf
UkxSCTB4MDgJLyogUmVMb2FkIFJlZ2lzdGVyICovCj4gICNkZWZpbmUgSVdER19TUgkJMHgwQwkv
KiBTdGF0dXMgUmVnaXN0ZXIgKi8KPiArI2RlZmluZSBJV0RHX1ZFUlIJMHgzRjQJLyogVmVyc2lv
biBSZWdpc3RlciAqLwo+ICAKPiAgLyogSVdER19LUiByZWdpc3RlciBiaXQgbWFzayAqLwo+ICAj
ZGVmaW5lIEtSX0tFWV9SRUxPQUQJMHhBQUFBCS8qIFJlbG9hZCBjb3VudGVyIGVuYWJsZSAqLwo+
ICAjZGVmaW5lIEtSX0tFWV9FTkFCTEUJMHhDQ0NDCS8qIFBlcmlwaGVyYWwgZW5hYmxlICovCj4g
ICNkZWZpbmUgS1JfS0VZX0VXQQkweDU1NTUJLyogV3JpdGUgYWNjZXNzIGVuYWJsZSAqLwo+ICsj
ZGVmaW5lIEtSX0tFWV9EV0EJMHgwMDAwCS8qIFdyaXRlIGFjY2VzcyBkaXNhYmxlKi8KPiAgCj4g
IC8qIElXREdfUFIgcmVnaXN0ZXIgYml0IHZhbHVlcyAqLwo+ICAjZGVmaW5lIFBSXzI1NgkJMHgw
NgkvKiBQcmVzY2FsZXIgc2V0IHRvIDI1NiAqLwo+IEBAIC0zNiwxMCArMzgsMTcgQEAKPiAgLyog
SVdER19TUiByZWdpc3RlciBiaXQgdmFsdWVzICovCj4gICNkZWZpbmUgU1JfUFZVCQlCSVQoMCkJ
LyogV2F0Y2hkb2cgcHJlc2NhbGVyIHZhbHVlIHVwZGF0ZSAqLwo+ICAjZGVmaW5lIFNSX1JWVQkJ
QklUKDEpCS8qIFdhdGNoZG9nIGNvdW50ZXIgcmVsb2FkIHZhbHVlIHVwZGF0ZSAqLwo+ICsjZGVm
aW5lIFNSX09ORgkJQklUKDgpCS8qIFdhdGNoZG9nIGVuYWJsZSBzdGF0dXMgYml0ICovCj4gKwo+
ICsvKiBJV0RHIENvbXBhdGliaWxpdHkgKi8KPiArI2RlZmluZSBPTkZfTUlOX1ZFUgkweDMxCj4g
Kwo+ICsjZGVmaW5lIFRJTUVPVVRfVVMJMTAwMDAKPiAgCj4gIHN0cnVjdCBzdG0zMm1wX3dkdF9w
cml2IHsKPiAgCWZkdF9hZGRyX3QgYmFzZTsJCS8qIHJlZ2lzdGVycyBhZGRyIGluIHBoeXNpY2Fs
IG1lbW9yeSAqLwo+ICAJdW5zaWduZWQgbG9uZyB3ZHRfY2xrX3JhdGU7CS8qIFdhdGNoZG9nIGRl
ZGljYXRlZCBjbG9jayByYXRlICovCj4gKwl1bnNpZ25lZCBpbnQgaHdfdmVyc2lvbjsJLyogUGVy
aXBoZXJhbCB2ZXJzaW9uICovCj4gIH07Cj4gIAo+ICBzdGF0aWMgaW50IHN0bTMybXBfd2R0X3Jl
c2V0KHN0cnVjdCB1ZGV2aWNlICpkZXYpCj4gQEAgLTkwLDYgKzk5LDcgQEAgc3RhdGljIGludCBz
dG0zMm1wX3dkdF9zdGFydChzdHJ1Y3QgdWRldmljZSAqZGV2LCB1NjQgdGltZW91dF9tcywgdWxv
bmcgZmxhZ3MpCj4gIHN0YXRpYyBpbnQgc3RtMzJtcF93ZHRfcHJvYmUoc3RydWN0IHVkZXZpY2Ug
KmRldikKPiAgewo+ICAJc3RydWN0IHN0bTMybXBfd2R0X3ByaXYgKnByaXYgPSBkZXZfZ2V0X3By
aXYoZGV2KTsKPiArCXUzMiBybHIsIHNyOwo+ICAJc3RydWN0IGNsayBjbGs7Cj4gIAlpbnQgcmV0
Owo+ICAKPiBAQCAtMTE1LDYgKzEyNSwyOSBAQCBzdGF0aWMgaW50IHN0bTMybXBfd2R0X3Byb2Jl
KHN0cnVjdCB1ZGV2aWNlICpkZXYpCj4gIAo+ICAJcHJpdi0+d2R0X2Nsa19yYXRlID0gY2xrX2dl
dF9yYXRlKCZjbGspOwo+ICAKPiArCXByaXYtPmh3X3ZlcnNpb24gPSByZWFkbChwcml2LT5iYXNl
ICsgSVdER19WRVJSKTsKPiArCj4gKwlpZiAocHJpdi0+aHdfdmVyc2lvbiA+PSBPTkZfTUlOX1ZF
Uikgewo+ICsJCWlmIChyZWFkbChwcml2LT5iYXNlICsgSVdER19TUikgJiBTUl9PTkYpCj4gKwkJ
CXdkdF9zZXRfZm9yY2VfYXV0b3N0YXJ0KGRldik7Cj4gKwl9IGVsc2Ugewo+ICsJCS8qCj4gKwkJ
ICogV29ya2Fyb3VuZCBmb3Igb2xkIHZlcnNpb25zIHdpdGhvdXQgSVdER19TUl9PTkYgYml0Ogo+
ICsJCSAqIC0gd3JpdGUgaW4gSVdER19STFJfT0ZGU0VUCj4gKwkJICogLSB3YWl0IGZvciBzeW5j
Cj4gKwkJICogLSBpZiBzeW5jIHN1Y2NlZWRzLCB0aGVuIGl3ZGcgaXMgcnVubmluZwo+ICsJCSAq
Lwo+ICsJCXdyaXRlbChLUl9LRVlfRVdBLCBwcml2LT5iYXNlICsgSVdER19LUik7Cj4gKwkJcmxy
ID0gcmVhZGwocHJpdi0+YmFzZSArIElXREdfUkxSKTsKPiArCQl3cml0ZWwocmxyLCBwcml2LT5i
YXNlICsgSVdER19STFIpOwo+ICsJCXJldCA9IHJlYWRsX3BvbGxfdGltZW91dChwcml2LT5iYXNl
ICsgSVdER19TUiwgc3IsIHNyICYgU1JfUlZVLAo+ICsJCQkJCSBUSU1FT1VUX1VTKTsKPiArCQlp
ZiAoIXJldCkKPiArCQkJd2R0X3NldF9mb3JjZV9hdXRvc3RhcnQoZGV2KTsKPiArCj4gKwkJd3Jp
dGVsKEtSX0tFWV9EV0EsIHByaXYtPmJhc2UgKyBJV0RHX0tSKTsKPiArCX0KPiArCj4gIAlkZXZf
ZGJnKGRldiwgIklXREcgaW5pdCBkb25lXG4iKTsKPiAgCj4gIAlyZXR1cm4gMDsKUmV2aWV3ZWQt
Ynk6IFBhdHJpY2UgQ2hvdGFyZCA8cGF0cmljZS5jaG90YXJkQGZvc3Muc3QuY29tPgoKVGhhbmtz
ClBhdHJpY2UKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
VWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlz
dGluZm8vdWJvb3Qtc3RtMzIK
