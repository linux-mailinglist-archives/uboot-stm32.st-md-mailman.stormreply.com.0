Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E97757106DF
	for <lists+uboot-stm32@lfdr.de>; Thu, 25 May 2023 10:09:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8BA96C6A611;
	Thu, 25 May 2023 08:09:02 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 477A7C0356E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 May 2023 08:09:01 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34P7QcdL013040; Thu, 25 May 2023 10:08:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=QDiifkfnmFRyg9kGwjNP5Iw4c3TLmxL3/ytGiULT9eA=;
 b=2beQGobnWLYXQIkHv25y2CR8P/4lt9qVHEDVmFDRz/FI3NcfNnAglIro4DcqlCrZJma8
 rMslLelT9jNR35EO+xdLuTmlwgt+JwMRmFkhKY6VxlAI2A9fGJubRdHVkULkYSODEgnl
 ygPle1P/16cORVCAvy0JCg10C4/6avk6/1xW3VflcRgh4jAfSNpCZsQQ8hLishsE0Rap
 GLYnzXqM5KdVYXAz+tkUCTUeccwtsTmJl/lJ9YTiK6QdfIS6Fhs/2WMl+ozmdb0Nkhk0
 INgcdsgbiLGdsyPlCQbrcHF6LH9BkJO98Lqzc4yacOUjtAzG6H7GQRD3QeamL6Jz7gBk eQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3qt39trafd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 May 2023 10:08:59 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A5C1910002A;
 Thu, 25 May 2023 10:08:58 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 99EF3212FC4;
 Thu, 25 May 2023 10:08:58 +0200 (CEST)
Received: from [10.48.1.0] (10.48.1.0) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Thu, 25 May
 2023 10:08:57 +0200
Message-ID: <e171b09d-0e7d-1815-6133-0946212a08d9@foss.st.com>
Date: Thu, 25 May 2023 10:08:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, <u-boot@lists.denx.de>
References: <20230517220239.329807-1-marex@denx.de>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20230517220239.329807-1-marex@denx.de>
X-Originating-IP: [10.48.1.0]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-25_04,2023-05-24_01,2023-05-22_02
Cc: uboot-stm32@st-md-mailman.stormreply.com
Subject: Re: [Uboot-stm32] [PATCH] ARM: stm32: Power cycle Buck3 in reset on
	DHSOM
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

SGkgTWFyZWssCgpPbiA1LzE4LzIzIDAwOjAyLCBNYXJlayBWYXN1dCB3cm90ZToKPiBJbiBjYXNl
IHRoZSBESFNPTSBpcyBpbiBzdXNwZW5kIHN0YXRlIGFuZCBlaXRoZXIgcmVzZXQgYnV0dG9uIGlz
IHB1c2hlZAo+IG9yIElXREcyIHRyaWdnZXJzIGEgd2F0Y2hkb2cgcmVzZXQsIHRoZW4gRFJBTSBp
bml0aWFsaXphdGlvbiBjb3VsZCBmYWlsCj4gYXMgZm9sbG93czoKPgo+ICAgICIKPiAgICBSQU06
IEREUjNMIDMyYml0cyAyeDRHYiA1MzNNSHoKPiAgICBERFIgaW52YWxpZCBzaXplIDogMHg0LCBl
eHBlY3RlZCAweDQwMDAwMDAwCj4gICAgRFJBTSBpbml0IGZhaWxlZDogLTIyCj4gICAgIyMjIEVS
Uk9SICMjIyBQbGVhc2UgUkVTRVQgdGhlIGJvYXJkICMjIwo+ICAgICIKPgo+IEF2b2lkIHRoaXMg
ZmFpbHVyZSBieSBub3Qga2VlcGluZyBhbnkgQnVjayByZWd1bGF0b3JzIGVuYWJsZWQgZHVyaW5n
IHJlc2V0LAo+IGxldCB0aGUgU29DIGFuZCBEUkFNcyBwb3dlciBjeWNsZSBmdWxseS4gU2luY2Ug
dGhlIGNoYW5nZSB3aGljaCBrZWVwcyBCdWNrMwo+IFZERCBlbmFibGVkIGR1cmluZyByZXNldCBp
cyBTVCBzcGVjaWZpYywgbW92ZSB0aGlzIGFkZGl0aW9uIHRvIFNUIHNwZWNpZmljCj4gU1BMIGJv
YXJkIGluaXRpYWxpemF0aW9uIHNvIHRoYXQgaXQgd291bGRuJ3QgYWZmZWN0IHRoZSBESFNPTSAu
Cgo+IFNpZ25lZC1vZmYtYnk6IE1hcmVrIFZhc3V0IDxtYXJleEBkZW54LmRlPgo+IC0tLQo+IE5P
VEU6IFRoaXMgaXMgMjAyMy4wNyBtYXRlcmlhbAo+IE5PVEU6IGQxYTRiMDlkZTY0ICgiYm9hcmQ6
IHN0OiBzdHBtaWMxOiBhZGQgZnVuY3Rpb24gc3RwbWljMV9pbml0IikKPiAgICAgICAgbWVudGlv
bnMgJ2tlZXAgdmRkIG9uIGR1cmluZyB0aGUgcmVzZXQgY3ljbGUgKHRvIGF2b2lkIGlzc3VlCj4g
ICAgICAgIHdoZW4gYmFja3VwIGJhdHRlcnkgaXMgYWJzZW50KScsIGJ1dCB0aGVyZSBpcyBubyBm
dXJ0aGVyCj4gICAgICAgIGRlc2NyaXB0aW9uIG9mIHRoZSAnaXNzdWUnLiBDYW4geW91IHBsZWFz
ZSBlbGFib3JhdGUgPwoKCgpJbiB0aGUgY29tbWl0IG1lc3NhZ2Ugb2YgZDFhNGIwOWRlNjQzICgi
Ym9hcmQ6IHN0OiBzdHBtaWMxOgoKYWRkIGZ1bmN0aW9uIHN0cG1pYzFfaW5pdCIpLCBJIGluZGlj
YXRlZAoKIMKgIC0ga2VlcCB2ZGQgb24gZHVyaW5nIHRoZSByZXNldCBjeWNsZSAodG8gYXZvaWQg
aXNzdWUgd2hlbiBiYWNrdXAgYmF0dGVyeQogwqDCoMKgwqDCoCBpcyBhYnNlbnQpCgoKT24gU1Qg
Ym9hcmRzIHdlIGhhdmUgc3VwcG9ydCBvZiBjZWxsIGNvaW4gdG8gYWxsb3cgc3VwcG9ydCBvZiBi
YWNrdXAgZG9tYWluLAoKYnV0IGJ5IGRlZmF1bHQgdGhpcyBjZWxsIGFyZSBhYnNlbnQgYW5kIHRo
ZSBiYWNrdXAgZG9tYWluIGlzIGRpcmVjdGx5IApwb3dlcmVkCgpieSBWREQgKGRpcmVjdGx5IGNv
bm5lY3RlZCBieSByZXNpc3RvcikuCgoKV2Uga2VlcCBwb3dlcmVkIHRoaXMgZG9tYWluIHRvIGRv
bid0IGxvc3MgdGhlIGJhY2t1cCBkb21haW4gc3VwcG9ydCwKCnRvIGF2b2lkIHRvIGxvc3MgdGhl
IGluZm9ybWF0aW9uIHNhdmVkIGluIGJhY2t1cCBSQU0gLyByZWdpc3RlcnMsCgphbmQgdG8gYmUg
YWJibGUgdG8ga2VlcCBERUJVRyBwYXJ0IHBvd2VyZWQgYWxzby4KCgpPbiB0aGlzIFNUIGJvYXJk
LCBpZiB0aGUgVkREIGlzIHNodXQgZG93biB3aXRoIHJlc2V0LCB0aGUgYmFja3VwIGRvbWFpbiAK
Y2FuJ3QgYmUKCmNvcnJlY3RseSBtYW5hZ2VkIGZvciByZWJvb3QuCgoKQW5kIHRvIGhhbmRsZSBj
b3JyZWN0bHkgcG93ZXIgT0ZGIG9uIFNUIGJvYXJkcyB3aXRoIFBNSUMsIHdlIHdpbGwgZG9uJ3Qg
CnNodXQgZG93bgoKdGhlIFZERCAoZnVsbCBQTUlDIHNodXQgZG93bikgYnV0IHdlIGtlZXAgaXQu
CgoKU28gdGhlIGJhY2t1cCBkb21haW4gaXMgbG9vc2VkIG9uIFNUIGJvYXJkIHdpdGggU1RQTUlD
MSBvbmx5IHdoZW4gdGhlIHBvd2VyCgppcyByZW1vdmVkIGFuZCBub3QgZm9yIHJlc2V0IG9yIGZv
ciBwb3dlciBvZmYuCgoKPiAtLS0KPiBDYzogUGF0cmljZSBDaG90YXJkIDxwYXRyaWNlLmNob3Rh
cmRAZm9zcy5zdC5jb20+Cj4gQ2M6IFBhdHJpY2sgRGVsYXVuYXkgPHBhdHJpY2suZGVsYXVuYXlA
Zm9zcy5zdC5jb20+Cj4gQ2M6IHVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20KPiAtLS0KPiAgIGJvYXJkL3N0L2NvbW1vbi9zdHBtaWMxLmMgfCAxMCArKystLS0tLS0tCj4g
ICBib2FyZC9zdC9jb21tb24vc3RwbWljMS5oIHwgIDIgKy0KPiAgIGJvYXJkL3N0L3N0bTMybXAx
L3NwbC5jICAgfCAxMyArKysrKysrKysrKy0tCj4gICAzIGZpbGVzIGNoYW5nZWQsIDE1IGluc2Vy
dGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2JvYXJkL3N0L2NvbW1v
bi9zdHBtaWMxLmMgYi9ib2FyZC9zdC9jb21tb24vc3RwbWljMS5jCj4gaW5kZXggZDUyZGNlNGY2
NTcuLjk2OWFkNDg0ODY0IDEwMDY0NAo+IC0tLSBhL2JvYXJkL3N0L2NvbW1vbi9zdHBtaWMxLmMK
PiArKysgYi9ib2FyZC9zdC9jb21tb24vc3RwbWljMS5jCj4gQEAgLTE4NSwyMSArMTg1LDE3IEBA
IHN0YXRpYyBpbnQgc3RtcGljX2J1Y2sxX3NldChzdHJ1Y3QgdWRldmljZSAqZGV2LCB1MzIgdm9s
dGFnZV9tdikKPiAgIH0KPiAgIAo+ICAgLyogZWFybHkgaW5pdCBvZiBQTUlDICovCj4gLXZvaWQg
c3RwbWljMV9pbml0KHUzMiB2b2x0YWdlX212KQo+ICtzdHJ1Y3QgdWRldmljZSAqc3RwbWljMV9p
bml0KHUzMiB2b2x0YWdlX212KQo+ICAgewo+ICAgCXN0cnVjdCB1ZGV2aWNlICpkZXY7Cj4gICAK
PiAgIAlpZiAodWNsYXNzX2dldF9kZXZpY2VfYnlfZHJpdmVyKFVDTEFTU19QTUlDLAo+ICAgCQkJ
CQlETV9EUklWRVJfR0VUKHBtaWNfc3RwbWljMSksICZkZXYpKQo+IC0JCXJldHVybjsKPiArCQly
ZXR1cm4gTlVMTDsKPiAgIAo+ICAgCS8qIHVwZGF0ZSBWRERDT1JFID0gQlVDSzEgKi8KPiAgIAlp
ZiAodm9sdGFnZV9tdikKPiAgIAkJc3RtcGljX2J1Y2sxX3NldChkZXYsIHZvbHRhZ2VfbXYpOwo+
ICAgCj4gLQkvKiBLZWVwIHZkZCBvbiBkdXJpbmcgdGhlIHJlc2V0IGN5Y2xlICovCj4gLQlwbWlj
X2NscnNldGJpdHMoZGV2LAo+IC0JCQlTVFBNSUMxX0JVQ0tTX01SU1RfQ1IsCj4gLQkJCVNUUE1J
QzFfTVJTVF9CVUNLKFNUUE1JQzFfQlVDSzMpLAo+IC0JCQlTVFBNSUMxX01SU1RfQlVDSyhTVFBN
SUMxX0JVQ0szKSk7Cj4gKwlyZXR1cm4gZGV2Owo+ICAgfQo+IGRpZmYgLS1naXQgYS9ib2FyZC9z
dC9jb21tb24vc3RwbWljMS5oIGIvYm9hcmQvc3QvY29tbW9uL3N0cG1pYzEuaAo+IGluZGV4IGIx
N2Q2ZjE2MzM4Li43YTcxNjlkN2NlYSAxMDA2NDQKPiAtLS0gYS9ib2FyZC9zdC9jb21tb24vc3Rw
bWljMS5oCj4gKysrIGIvYm9hcmQvc3QvY29tbW9uL3N0cG1pYzEuaAo+IEBAIC0zLDQgKzMsNCBA
QAo+ICAgICogQ29weXJpZ2h0IChDKSAyMDIwLCBTVE1pY3JvZWxlY3Ryb25pY3MgLSBBbGwgUmln
aHRzIFJlc2VydmVkCj4gICAgKi8KPiAgIAo+IC12b2lkIHN0cG1pYzFfaW5pdCh1MzIgdm9sdGFn
ZV9tdik7Cj4gK3N0cnVjdCB1ZGV2aWNlICpzdHBtaWMxX2luaXQodTMyIHZvbHRhZ2VfbXYpOwo+
IGRpZmYgLS1naXQgYS9ib2FyZC9zdC9zdG0zMm1wMS9zcGwuYyBiL2JvYXJkL3N0L3N0bTMybXAx
L3NwbC5jCj4gaW5kZXggNzQ3ZWM3ZTQ0NWEuLjhiNGE1MjlmNzU5IDEwMDY0NAo+IC0tLSBhL2Jv
YXJkL3N0L3N0bTMybXAxL3NwbC5jCj4gKysrIGIvYm9hcmQvc3Qvc3RtMzJtcDEvc3BsLmMKPiBA
QCAtNSw2ICs1LDggQEAKPiAgIAo+ICAgI2luY2x1ZGUgPGNvbmZpZy5oPgo+ICAgI2luY2x1ZGUg
PGNvbW1vbi5oPgo+ICsjaW5jbHVkZSA8cG93ZXIvcG1pYy5oPgo+ICsjaW5jbHVkZSA8cG93ZXIv
c3RwbWljMS5oPgo+ICAgI2luY2x1ZGUgPGFzbS9hcmNoL3N5c19wcm90by5oPgo+ICAgI2luY2x1
ZGUgIi4uL2NvbW1vbi9zdHBtaWMxLmgiCj4gICAKPiBAQCAtMTksOCArMjEsMTUgQEAgdm9pZCBi
b2FyZF92ZGRjb3JlX2luaXQodTMyIHZvbHRhZ2VfbXYpCj4gICAKPiAgIGludCBib2FyZF9lYXJs
eV9pbml0X2Yodm9pZCkKPiAgIHsKPiAtCWlmIChJU19FTkFCTEVEKENPTkZJR19QTUlDX1NUUE1J
QzEpICYmIENPTkZJR19JU19FTkFCTEVEKFBPV0VSKSkKPiAtCQlzdHBtaWMxX2luaXQob3BwX3Zv
bHRhZ2VfbXYpOwo+ICsJaWYgKElTX0VOQUJMRUQoQ09ORklHX1BNSUNfU1RQTUlDMSkgJiYgQ09O
RklHX0lTX0VOQUJMRUQoUE9XRVIpKSB7Cj4gKwkJc3RydWN0IHVkZXZpY2UgKmRldiA9IHN0cG1p
YzFfaW5pdChvcHBfdm9sdGFnZV9tdik7Cj4gKwo+ICsJCS8qIEtlZXAgdmRkIG9uIGR1cmluZyB0
aGUgcmVzZXQgY3ljbGUgKi8KPiArCQlwbWljX2NscnNldGJpdHMoZGV2LAo+ICsJCQkJU1RQTUlD
MV9CVUNLU19NUlNUX0NSLAo+ICsJCQkJU1RQTUlDMV9NUlNUX0JVQ0soU1RQTUlDMV9CVUNLMyks
Cj4gKwkJCQlTVFBNSUMxX01SU1RfQlVDSyhTVFBNSUMxX0JVQ0szKSk7Cj4gKwl9Cj4gICAKPiAg
IAlyZXR1cm4gMDsKPiAgIH0KClJldmlld2VkLWJ5OiBQYXRyaWNrIERlbGF1bmF5IDxwYXRyaWNr
LmRlbGF1bmF5QGZvc3Muc3QuY29tPgoKVGhhbmtzClBhdHJpY2sKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVi
b290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
