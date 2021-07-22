Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2CC3D204D
	for <lists+uboot-stm32@lfdr.de>; Thu, 22 Jul 2021 11:04:01 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E937BC5A4CD;
	Thu, 22 Jul 2021 09:04:00 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 88E98C57189
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Jul 2021 09:03:58 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16M91kYH004191; Thu, 22 Jul 2021 11:03:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=ed+7RdT6eBUpMaygIdKT1S5vicjOgKBYUeMU1jE/hIQ=;
 b=EQ1v4+3A9Ke5ZgLP5DEfXAli7zZ1VXxTNydr87dLmHY9/JYmN/8S7DGZn24BvUD27U2W
 P5ex7vQ4SZmRaAO0spW2s+6CEVmxAFDIPSeT2dyPBlvGFdOSit4TDLPf2lmz2/c4rtK3
 Iwds/a/j/XeD1dA2U3YrndfVwT0wzuRm0y17OWWayKdZWQJooSTgo5EL58QNZuv4rI9f
 OrAomGVZmwQUhQUO46BN/ldna7ruJqt7bRNQzV/GYEv1Y/iD1k6wXHGgzohYafM4dCI1
 nmp1TTBxqfwd5jBs7tMOEgWRsrKiTrvWJqyLMvfRVkA7rajU6RjSplKtf76o8PehfcFE Rg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39y43wrp5t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Jul 2021 11:03:53 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 47EFE10003A;
 Thu, 22 Jul 2021 11:03:52 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0B34C21D3A3;
 Thu, 22 Jul 2021 11:03:52 +0200 (CEST)
Received: from lmecxl0994.lme.st.com (10.75.127.50) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 22 Jul
 2021 11:03:51 +0200
To: gianluca <gianlucarenzi@eurek.it>, <u-boot@lists.denx.de>
References: <454648fd-7145-fe3f-c95d-dd17c33d8f17@eurek.it>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <6ba30090-b390-9e07-4d1a-b21ae0d40106@foss.st.com>
Date: Thu, 22 Jul 2021 11:03:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <454648fd-7145-fe3f-c95d-dd17c33d8f17@eurek.it>
Content-Language: en-US
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-22_04:2021-07-22,
 2021-07-22 signatures=0
Cc: Gianluca Renzi <icjtqr@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] U-BOOT 2021.07 and STM32MP15x issues for Trusted
	Boot Chain
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

SGkgR2lhbmx1Y2EsCgpPbiA3LzIyLzIxIDEwOjAxIEFNLCBnaWFubHVjYSB3cm90ZToKPiBIZWxs
byBsaXN0LAo+IEkgd2FzIHdvbmRlcmluZyB3aGF0IEkgYW0gZG9pbmcgd3JvbmcgZm9sbG93aW5n
IHRoZSBwcm9jZWR1cmUgCj4gZXhwbGFpbmVkIGluIHRoZSBkb2MvYm9hcmQvc3Qvc3RtMzJtcDEu
cnN0IGRvY3VtZW50YXRpb24gZmlsZS4KPgo+IEkgYW0gdXNpbmcgdGhlIGxhdGVzdCBnaXQgdmVy
c2lvbiAodGhlIE1ha2VmaWxlIHNheXMgMjAyMS4wNykuCj4KPiBNeSBnb2FsIGlzIHRvIHJ1biBm
cm9tIHNkY2FyZCBpbiB0cnVzdGVkIGJvb3QgY2hhaW4gKFRydXN0Wm9uZSBzZWN1cmUgCj4gbW9u
aXRvcikgdGhlIGV2YWx1YXRpb24ga2l0IFNUTTMyTVAxNTdDLURLMi4KPgo+IFRoZSBwcm9jZWR1
cmUgc2F5czoKPgo+PiBUaGUgKipUcnVzdGVkKiogYm9vdCBjaGFpbgo+PiBgYGBgYGBgYGBgYGBg
YGBgYGBgYGBgYGBgYAo+Pgo+PiBkZWZjb25maWdfZmlsZSA6IHN0bTMybXAxNV90cnVzdGVkX2Rl
ZmNvbmZpZwo+Pgo+PiArLS0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKy0t
LS0tLS0tLS0tLSstLS0tLS0tKwo+PiDCoMKgwqAgfMKgIFJPTSBjb2RlwqDCoCB8IEZTQkzCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IFNTQkzCoMKgwqDCoMKgwqAgfCBP
UyB8Cj4+IMKgwqDCoCArICstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLSst
LS0tLS0tKwo+PiDCoMKgwqAgfMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8VHJ1c3RlZCBGaXJt
d2FyZS1BIChURi1BKXwgVS1Cb290wqDCoMKgwqAgfCBMaW51eCB8Cj4+ICstLS0tLS0tLS0tLS0t
Ky0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0tKy0tLS0tLS0rCj4+IMKgwqDC
oCB8IFRydXN0Wm9uZcKgwqAgfHNlY3VyZSBtb25pdG9yIHwKPj4gKy0tLS0tLS0tLS0tLS0rLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0rLS0tLS0tLSsKPj4KPj4gVEYtQSBw
ZXJmb3JtcyBhIGZ1bGwgaW5pdGlhbGl6YXRpb24gb2YgU2VjdXJlIHBlcmlwaGVyYWxzIGFuZCBp
bnN0YWxscyBhCj4+IHNlY3VyZSBtb25pdG9yLCBCTDMyOgo+Pgo+PiDCoCAqIFNQTWluIHByb3Zp
ZGVkIGJ5IFRGLUEgb3IKPj4gwqAgKiBPUC1URUUgZnJvbSBzcGVjaWZpYyBwYXJ0aXRpb25zICh0
ZWVoLCB0ZWVkLCB0ZWV4KS4KPj4KPj4gVS1Cb290IGlzIHJ1bm5pbmcgaW4gbm9ybWFsIHdvcmxk
IGFuZCB1c2VzIHRoZSBzZWN1cmUgbW9uaXRvciB0byBhY2Nlc3MKPj4gdG8gc2VjdXJlIHJlc291
cmNlcy4KPgo+IEFzIGZhciBhcyBJIHVuZGVyc3RhbmQgdGhlcmUgaXMgb25seSBhIHNpbmdsZSBm
aXJzdC1zdGFnZS1ib290LWxvYWRlciAKPiAoRlNCTCkgYW5kIGEgc2Vjb25kLXN0YWdlLWJvb3Qt
bG9hZGVyIChTU0JMKSwgb3RoZXJ3aXNlIGluIHRoZSAqQmFzaWMgCj4gQm9vdCBDaGFpbiogSSBo
YXZlIEZTQkwxIGFuZCBGU0JMMiBfYW5kXyBhIFNTQkwuCj4KPgoKRlNCTDEgLyBGQlNMMiA9PiBj
YW4gYmUgdXNlIGZvciBiYXNpYyBvciB0cnVzdGVkIGJvb3QgY2hhaW4gPSBpdCBpcyAyIApjb3B5
IGZvciB0aGUgRlNCTCBmb3IgZmFpbHNhZmUgdXBkYXRlCgp0aGUgUk9NIGNvZGUgd2lsbCBjaGVj
ayBpbnRlZ3JpdHkgb2YgRlNCTDEgLi4uLi4gaWYgaXQgaXMgZmFpbGluZywgaXQgCndpbGwgdXNl
IEZTQkwyIGluc3RlYWQKCgpUaGlzIGZlYXR1cmUgYWxsbyB0byBhbHdheXMgYm9vdCBldmVuIGlm
IEZTQkwxIHVwZGF0ZSBpcyBpbnRlcnJ1cHRlZC4uLi4KCmlmIHRoaXMgZmVhdHVyZSBpcyBub3Qg
bmVlZGVkIHlvdSBjYW4gcmVtb3ZlIHRoZSBzZWNvbmQgRlNCTCBwYXJ0aXRpb24uCgoKPj4gQnVp
bGQgUHJvY2VkdXJlCj4+IC0tLS0tLS0tLS0tLS0tLQo+Pgo+PiAxLiBJbnN0YWxsIHRoZSByZXF1
aXJlZCB0b29scyBmb3IgVS1Cb290Cj4+Cj4+IMKgwqAgKiBpbnN0YWxsIHBhY2thZ2UgbmVlZGVk
IGluIFUtQm9vdCBtYWtlZmlsZQo+PiDCoMKgwqDCoCAobGlic3NsLWRldiwgc3dpZywgbGlicHl0
aG9uLWRldi4uLikKPj4KPj4gwqDCoCAqIGluc3RhbGwgQVJNdjcgdG9vbGNoYWluIGZvciAzMmJp
dCBDb3J0ZXgtQSAoZnJvbSBMaW5hcm8sCj4+IMKgwqDCoMKgIGZyb20gU0RLIGZvciBTVE0zMk1Q
MTV4LCBvciBhbnkgY3Jvc3N0b29sY2hhaW5zIGZyb20geW91ciAKPj4gZGlzdHJpYnV0aW9uKQo+
PiDCoMKgwqDCoCAoeW91IGNhbiB1c2UgYW55IGdjYyBjcm9zcyBjb21waWxlciBjb21wYXRpYmxl
IHdpdGggVS1Cb290KQo+Pgo+Cj4gRG9uZS4gSSBhbSBpbiBhIERlYmlhbiBCdXN0ZXIgRGV2ZWxX
b3Jrc3RhdGlvbiwgc28gZXZlcnl0aGluZyBpcyAKPiBjb21pbmcgZnJvbSB0aGUgb2ZmaWNpYWwg
cmVwb3MuCj4KPiBBdCB0aGUgbW9tZW50IHRoZSBhcm0gdG9vbGNoYWluIGlzOiA+IGFybS1saW51
eC1nbnVlYWJpaGYtZ2NjIC12Cj4KKC4uLikKCgo+Pgo+PiA2LiBPdXRwdXQgZmlsZXMKPj4KPj4g
wqDCoCBCb290Um9tIGFuZCBURi1BIGV4cGVjdCBiaW5hcmllcyB3aXRoIFNUTTMyIGltYWdlIGhl
YWRlcgo+PiDCoMKgIFNQTCBleHBlY3RzIEdpYW5sdWNhZmlsZSB3aXRoIFUtQm9vdCB1SW1hZ2Ug
aGVhZGVyCj4+Cj4+IMKgwqAgU28gaW4gdGhlIG91dHB1dCBkaXJlY3RvcnkgKHNlbGVjdGVkIGJ5
IEtCVUlMRF9PVVRQVVQpLAo+PiDCoMKgIHlvdSBjYW4gZm91bmQgdGhlIG5lZWRlZCBmaWxlczoK
Pj4KPj4gwqAgLSBGb3IgKipUcnVzdGVkKiogYm9vdCAod2l0aCBvciB3aXRob3V0IE9QLVRFRSkK
Pj4KPj4gwqDCoMKgwqAgLSBGU0JMID0gKip0Zi1hLnN0bTMyKiogKHByb3ZpZGVkIGJ5IFRGLUEg
Y29tcGlsYXRpb24pCj4+IMKgwqDCoMKgIC0gU1NCTCA9ICoqdS1ib290LnN0bTMyKioKPgo+IE5v
IHRmLWEuc3RtMzIgZm9yIFRydXN0Wm9uZSBCb290IGJ1dCBvbmx5IHRoZSB1LWJvb3Quc3RtMzIg
ZmlsZS4KPgoKInRmLWEuc3RtMzIiIGlzIHByb3ZpZGVkIGJ5IFRGLUEgY29tcGlsYXRpb24gKHNl
ZSBhZnRlci4KCgo+Pgo+PiDCoCAtIEZvciBCYXNpYyBib290Cj4+Cj4+IMKgwqDCoMKgIC0gRlNC
TCA9IHNwbC91LWJvb3Qtc3BsLnN0bTMyCj4+IMKgwqDCoMKgIC0gU1NCTCA9IHUtYm9vdC5pbWcK
Pgo+IGZpbmQgLiAtbmFtZSAndGYtYS5zdG0zMicKPgo+IGZpbmQgLiAtbmFtZSAnKnRmLWEqJwo+
Cj4gZmluZCAuIC1uYW1lICcqdGZhKicKPiAuL2luY2x1ZGUvY29uZmlnL3RmYWJvb3QuaAo+IC4v
aW5jbHVkZS9jb25maWcvYXJjaC9zdXBwb3J0L3RmYWJvb3QuaAo+Cj4gV2hlcmUgaXMgdGhlIHRm
LWEuc3RtMzI/Pz8/Pwo+Cj4gU29tZXRoaW5nIG1pc3NpbmcgYnkgbXkgc2lkZT8/Pwo+Cj4KPiBS
ZWdhcmRzLAo+IEdpYW5sdWNhIFJlbnppCgoKIlRGLUEiwqAgPSAiVHJ1c3RlZCBGaXJtd2FyZS1B
IsKgIGlzIGEgc2VwYXJhdGUgY29tcG9uZW50IGFuZCBpdCBuZWVkIHRvIApiZSBjb21waWxlZCBz
ZXBhcmF0ZWx5LgoKVEYtQSByZWZlcmVuY2VzID0KCi0gaHR0cHM6Ly93d3cudHJ1c3RlZGZpcm13
YXJlLm9yZy9wcm9qZWN0cy90Zi1hLwoKLSBodHRwczovL3RydXN0ZWRmaXJtd2FyZS1hLnJlYWR0
aGVkb2NzLmlvL2VuL2xhdGVzdC8KCj0+IGh0dHBzOi8vZ2l0LnRydXN0ZWRmaXJtd2FyZS5vcmcv
VEYtQS90cnVzdGVkLWZpcm13YXJlLWEuZ2l0LwoKCkZvciBidWlsZCBpbmZvcm1hdGlvbiBhdCB1
cHN0cmVhbSwgeW91IGNhbiBjaGVjawoKaHR0cHM6Ly9naXQudHJ1c3RlZGZpcm13YXJlLm9yZy9U
Ri1BL3RydXN0ZWQtZmlybXdhcmUtYS5naXQvdHJlZS9kb2NzL3BsYXQvc3RtMzJtcDEucnN0CgpG
b3IgZmlyc3QgdGVzdCB5b3UgY2FuIHVzZSBTUF9taW4gYXMgc2VjdXJlIG1vbml0b3I6Cgp8bWFr
ZSBDUk9TU19DT01QSUxFPWFybS1saW51eC1nbnVlYWJpaGYtIFBMQVQ9c3RtMzJtcDEgQVJDSD1h
YXJjaDMyIApBUk1fQVJDSF9NQUpPUj03IEFBUkNIMzJfU1A9c3BfbWluIFNUTTMyTVBfU0RNTUM9
MSBTVE0zMk1QX0VNTUM9MSAKU1RNMzJNUF9SQVdfTkFORD0xIFNUTTMyTVBfU1BJX05BTkQ9MSBT
VE0zMk1QX1NQSV9OT1I9MSAKRFRCX0ZJTEVfTkFNRT1zdG0zMm1wMTU3Yy1ldjEuZHRiIHwKCkkg
d2lsbCB1cGRhdGUgdGhlIHN0bTMybXAxIHJlYWRtZSB0byBpbmRpY2F0ZSB0aGVzZSBtaXNzaW5n
IGluZm9ybWF0aW9uLgoKCnlvdSBuZWVkIHRvIGNvbXBpbGUgMiBwcm9qZWN0cwoKLSBURi1BID0+
IEZTQkwKCi0gVS1Cb290ID0+IFNTQkwKCgpQUzogdG8gaGF2ZSBhIGZ1bGwgc2VjdXJlIHN1cHBv
cnQgc3VwcG9ydCB3aXRoIEZJUCAod2hlbsKgIGl0IHdpbGwgYmUgCnN1cHBvcnRlZCBvbiBURi1B
IHNpZGUpLAoKeW91IGNhbiB1c2UgT1AtVEVFIGFzIHRoZSBzZWN1cmUgT1MuLi4uIGJ1dCBpdCBp
cyBhIHNlcGFyYXRlIHByb2plY3QKClRGLUEgUkVGID0KCi0gaHR0cHM6Ly93d3cub3AtdGVlLm9y
Zy8KCi0gaHR0cHM6Ly9vcHRlZS5yZWFkdGhlZG9jcy5pby9lbi9sYXRlc3QvCgotIEJVSUxEID0g
Cmh0dHBzOi8vb3B0ZWUucmVhZHRoZWRvY3MuaW8vZW4vbGF0ZXN0L2J1aWxkaW5nL2RldmljZXMv
c3RtMzJtcDEuaHRtbAoKPT4gaHR0cHM6Ly9naXRodWIuY29tL09QLVRFRS9vcHRlZV9vcwoKCklu
IHRoaXMgY2FzZSB5b3UgbmVlZCB0byBjb21waWxlIHRoZSBiaW5hcnkgaW5jbHVkZSBpbiBGSVAK
Ci0gT1AtVEVFID0+IFNlY3VyZSBPUwoKLSBVLUJvb3QgPT4gU1NCTAoKClRoZW4geW91IGNhbiBj
b21waWxlOgoKLSBURi1BID0+IEZTQkwgJiBGSVAgKGluY2x1ZGluZyBPUC1URUUgYW5kIFUtQm9v
dCkKCgpSZWdhcmRzCgpQYXRyaWNrCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
