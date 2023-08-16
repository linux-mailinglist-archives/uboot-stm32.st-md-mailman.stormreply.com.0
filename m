Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B8377E272
	for <lists+uboot-stm32@lfdr.de>; Wed, 16 Aug 2023 15:22:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A7111C6B45E;
	Wed, 16 Aug 2023 13:22:31 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 626BFC6907A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Aug 2023 13:22:30 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 37G9C4NV021292; Wed, 16 Aug 2023 15:22:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=7/b19q2mI6KhGNDBWvUC+0R8pSxIBh1b2/VvQi80ioI=; b=wq
 JGnS1634AyBX5N7JFYvNafozb/SMYKbyCtf1vHYdOtriAPXc5T1Px3S4dUkvfkCZ
 2SFAzAUnxZ2iNsEjeJq+MEze1tl5OebbTB5AAGM/oa23QlTe4EoAg2INveLyg6Nu
 jyEC5U6gAyKBD4SmkJQW3fl4TmwAf9vFtdLmFFcdphY7GtwGP7ZFo3YWVonbuk/U
 vnmV/BgHdHbyWGLVbCRCkyXakN9Z0EKdMKve0Shr7JU0LeTnzNUN4+i6G9q5XlEq
 TCbJ2lkSn2INPLjplHux3uXkKdLkZd0bW4UYtUBVNhkJWWw4d79GzBK1+HBus8f0
 i3nMP/WpZ5nACEfLRCKQ==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3sgum7hdkm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Aug 2023 15:22:19 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8F1CA10005D;
 Wed, 16 Aug 2023 15:22:18 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node4.st.com [10.75.129.133])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 81D6A23D413;
 Wed, 16 Aug 2023 15:22:18 +0200 (CEST)
Received: from [10.201.20.38] (10.201.20.38) by EQNDAG1NODE4.st.com
 (10.75.129.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Wed, 16 Aug
 2023 15:22:17 +0200
Message-ID: <fe65f376-a188-3f72-b6f8-58bd2a65542c@foss.st.com>
Date: Wed, 16 Aug 2023 15:22:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: Marek Vasut <marex@denx.de>, Patrick DELAUNAY
 <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20230517220239.329807-1-marex@denx.de>
 <e171b09d-0e7d-1815-6133-0946212a08d9@foss.st.com>
 <607a112c-4320-5a5f-b988-98e5ea8e3267@denx.de>
 <cb59086b-3212-3b46-990f-c8223a6122a4@denx.de>
 <f418e766-9063-496d-dd5c-05758cbabd38@foss.st.com>
 <bba7dcb0-285a-f3ed-1dcb-d631466c1ee2@denx.de>
 <40efc460-899d-f4d6-e79f-5c0e635f4387@denx.de>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <40efc460-899d-f4d6-e79f-5c0e635f4387@denx.de>
X-Originating-IP: [10.201.20.38]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To EQNDAG1NODE4.st.com
 (10.75.129.133)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-16_12,2023-08-15_02,2023-05-22_02
Cc: uboot-stm32@st-md-mailman.stormreply.com, christophe.priouzeau@foss.st.com,
 u-boot@dh-electronics.com
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

CgpPbiA3LzEwLzIzIDIzOjQzLCBNYXJlayBWYXN1dCB3cm90ZToKPiBPbiA2LzE3LzIzIDAyOjM2
LCBNYXJlayBWYXN1dCB3cm90ZToKPj4gT24gNi8xNi8yMyAxNTowNCwgUGF0cmljayBERUxBVU5B
WSB3cm90ZToKPj4+IEhpLAo+Pgo+PiBIaSwKPj4KPj4+PiBbwqDCoCAzOS40MjYwMTVdIERpc2Fi
bGluZyBub24tYm9vdCBDUFVzIC4uLgo+Pj4+IFvCoMKgIDM5LjQ0ODYzNV0gUmV0cnlpbmcgYWdh
aW4gdG8gY2hlY2sgZm9yIENQVSBraWxsCj4+Pj4gW8KgwqAgMzkuNDUxOTA5XSBDUFUxIGtpbGxl
ZC4KPj4+PiBVLUJvb3QgU1BMIDIwMjMuMDctcmM0LTAwMDA4LWcyZjQ2NjRmNWMzZSAoSnVuIDE1
IDIwMjMgLSAwODozNjo1MiArMDIwMCkKPj4+PiBSQU06IEREUjMtRERSM0wgMzJiaXRzIDUzMzAw
MGtIego+Pj4+IEREUiBpbnZhbGlkIHNpemUgOiAweDQsIGV4cGVjdGVkIDB4NDAwMDAwMDAKPj4+
PiBEUkFNIGluaXQgZmFpbGVkOiAtMjIKPj4+PiAjIyMgRVJST1IgIyMjIFBsZWFzZSBSRVNFVCB0
aGUgYm9hcmQgIyMjCj4+Pj4KPj4+PiBQcmVzcyBSRVNFVCBidXR0b24KPj4+Pgo+Pj4+IFUtQm9v
dCBTUEwgMjAyMy4wNy1yYzQtMDAwMDgtZzJmNDY2NGY1YzNlIChKdW4gMTUgMjAyMyAtIDA4OjM2
OjUyICswMjAwKQo+Pj4+IFJBTTogRERSMy1ERFIzTCAzMmJpdHMgNTMzMDAwa0h6Cj4+Pj4gRERS
IGludmFsaWQgc2l6ZSA6IDB4NCwgZXhwZWN0ZWQgMHg0MDAwMDAwMAo+Pj4+IERSQU0gaW5pdCBm
YWlsZWQ6IC0yMgo+Pj4+ICMjIyBFUlJPUiAjIyMgUGxlYXNlIFJFU0VUIHRoZSBib2FyZCAjIyMK
Pj4+Pgo+Pj4+Cj4+PiBJIHRyeSBpdCB3aXRoIHRoZSBsYXRlc3QgU1RNaWNyb2VsZWN0cm9uaWNz
IE9TUyBpbWFnZS4KPj4+Cj4+PiBJIGp1c3QgY2hhbmdlIGluIFUtQm9vdCBjb25maWcgdG8gYmUg
YWxpZ25lZCB0aGUgZXhwZWN0ZWQgU0QtQ2FyZCBwYXJ0aW9ubmluZwo+Pj4KPj4+IGNvbmZpZ3Mv
c3RtMzJtcDE1X2Jhc2ljX2RlZmNvbmZpZzoKPj4+Cj4+PiAtQ09ORklHX1NZU19NTUNTRF9SQVdf
TU9ERV9VX0JPT1RfUEFSVElUSU9OPTMKPj4+ICtDT05GSUdfU1lTX01NQ1NEX1JBV19NT0RFX1Vf
Qk9PVF9QQVJUSVRJT049NQo+Pj4KPj4+IEJ1dCBsb3cgcG93ZXIgaXMgbm90IHN1cHBvcnRlZCBp
biB0aGlzIGRvd25zdHJlYW0gY29uZmlnIDotPAo+Pgo+PiBVc2UgbXVsdGlfdjdfZGVmY29uZmln
IG9yIHNvbWUgc3VjaCA/Cj4+Cj4+PiBJIGdvdCB0aGUgZXJyb3I6Cj4+Pgo+Pj4KPj4+IC4uLi4u
Li4KPj4+IFUtQm9vdCBTUEwgMjAyMy4wNy1yYzQtMDAwMDgtZzJmNDY2NGY1YzNlZC1kaXJ0eSAo
SnVuIDE2IDIwMjMgLSAxMTozNzo1MiArMDIwMCkKPj4+IFJBTTogRERSMy1ERFIzTCAzMmJpdHMg
NTMzMDAwa0h6Cj4+PiBXRFQ6wqDCoCBTdGFydGVkIHdhdGNoZG9nQDVhMDAyMDAwIHdpdGggc2Vy
dmljaW5nIGV2ZXJ5IDEwMDBtcyAoMzJzIHRpbWVvdXQpCj4+PiBpbWFnZSBlbnRyeSBwb2ludDog
MHhjMDEwMDAwMAo+Pj4KPj4+Cj4+PiBVLUJvb3QgMjAyMy4wNy1yYzQtMDAwMDgtZzJmNDY2NGY1
YzNlZC1kaXJ0eSAoSnVuIDE2IDIwMjMgLSAxMTozNzo1MiArMDIwMCkKPj4+Cj4+PiBDUFU6IFNU
TTMyTVAxNTdGQUEgUmV2LloKPj4+IE1vZGVsOiBTVE1pY3JvZWxlY3Ryb25pY3MgU1RNMzJNUDE1
N0MgZXZhbCBkYXVnaHRlciBvbiBldmFsIG1vdGhlcgo+Pj4gQm9hcmQ6IHN0bTMybXAxIGluIGJh
c2ljIG1vZGUgKHN0LHN0bTMybXAxNTdjLWV2MSkKPj4+IEJvYXJkOiBNQjEyNjMgVmFyNC4wIFJl
di5DLTAzCj4+PiBEUkFNOsKgIDEgR2lCCj4+PiBDbG9ja3M6Cj4+PiAtIE1QVSA6IDgwMCBNSHoK
Pj4+IC0gTUNVIDogMjA4Ljg3OCBNSHoKPj4+IC0gQVhJIDogMjY2LjUwMCBNSHoKPj4+IC0gUEVS
IDogMjQgTUh6Cj4+PiAtIEREUiA6IDUzMyBNSHoKPj4+IENvcmU6wqAgMjg4IGRldmljZXMsIDQy
IHVjbGFzc2VzLCBkZXZpY2V0cmVlOiBzZXBhcmF0ZQo+Pj4gV0RUOsKgwqAgU3RhcnRlZCB3YXRj
aGRvZ0A1YTAwMjAwMCB3aXRoIHNlcnZpY2luZyBldmVyeSAxMDAwbXMgKDMycyB0aW1lb3V0KQo+
Pj4gTkFORDrCoCAxMDI0IE1pQgo+Pj4gTU1DOsKgwqAgU1RNMzIgU0QvTU1DOiAwLCBTVE0zMiBT
RC9NTUM6IDEKPj4+IExvYWRpbmcgRW52aXJvbm1lbnQgZnJvbSBNTUMuLi4gSW52YWxpZCBFTlYg
b2Zmc2V0IGluIE1NQywgY29weT0wCj4+PiBJbjrCoMKgwqAgc2VyaWFsCj4+PiBPdXQ6wqDCoCBz
ZXJpYWwKPj4+IEVycjrCoMKgIHNlcmlhbAo+Pj4gTmV0OsKgwqAgZXRoMDogZXRoZXJuZXRANTgw
MGEwMDAKPj4+IEhpdCBhbnkga2V5IHRvIHN0b3AgYXV0b2Jvb3Q6wqAgMAo+Pj4KPj4+IC4uLi4K
Pj4+IFvCoMKgwqAgMC4wMDAwMDBdIEJvb3RpbmcgTGludXggb24gcGh5c2ljYWwgQ1BVIDB4MAo+
Pj4gW8KgwqDCoCAwLjAwMDAwMF0gTGludXggdmVyc2lvbiA2LjQuMC1yYzYgKG9lLXVzZXJAb2Ut
aG9zdCkgKGFybS1vc3RsLWxpbnV4LWdudWVhYmktZ2NjIChHQ0MpIDEyLjIuMCwgR05VIGxkIChH
TlUgQmludXRpbHMpIDIuNDAuMjAyMzAxMTkpICMxIFNNUCBQUkVFTVBUIFN1biBKdW4gMTEgMjE6
MzU6MzAgVVRDIDIwMjMKPj4+IC4uLi4KPj4+IHJvb3RAc3RtMzJtcDEtZGlzY28tb3NzOn4jIHdo
aWxlIHRydWUgOyBkbyBydGN3YWtlIC1zIDEwMCAtbSBtZW0gOyBkb25lCj4+PiBydGN3YWtlOiB1
bnJlY29nbml6ZWQgc3VzcGVuZCBzdGF0ZSAnbWVtJwo+Pgo+PiBQbGVhc2UgZml4IHlvdXIga2Vy
bmVsIGNvbmZpZyBhbmQgZW5hYmxlIHN1c3BlbmQgdG8gbWVtLCBJIGFtIHN1cmUgdGhhdCBpcyBu
b3QgZGlmZmljdWx0Lgo+Pgo+Pj4gSSBjaGVjayBhbHNvIHdpdGggZG93bnN0cmVhbSAoT3BlblNU
TGludXggVjQuMCksCj4+Cj4+IFRoaXMgaXMgbm90IHJlbGV2YW50IHRvIHRoaXMgZGlzY3Vzc2lv
bi4KPj4KPj4+IGFuZCBJIGNhbid0IHJlcHJvZHVjZWQgdGhlIGlzc3VlIGJ1dCB3ZSBhcmUgdXNp
bmcgVEYtQcKgIC8gT1AtVEVFIC8gU0NNSSB0byBzdXBwb3J0IGFsbCB0aGUgbG93IHBvd2VyIG1v
ZGVzLgo+Pj4KPj4+Cj4+PiBBbmQgdGhpcyBsb3cgcG93ZXIgc3VwcG9ydCAoaW4gVEYtQS8gT1At
VEVFIC8gTGludXggd2l0aCBTQ01JKSBpcyBub3QgeWV0IHVwIHN0cmVhbWVkLgo+Pj4KPj4+Cj4+
PiBQUzogaWYgeW91IGFyZSBub3QgYWJsZSB0byByZXN0YXJ0IGV2ZW4gYWZ0ZXIgYSBSRVNFVCwK
Pj4+IMKgwqDCoMKgwqDCoCBJIGFzc3VtZSBzb21ldGhpbmcgaXMgd3JvbmcgaW4gdGhlIFBNSUMg
Y29uZmlndXJhdGlvbgo+Pj4KPj4+IMKgwqDCoMKgwqDCoCAoZm9yIGV4YW1wbGUgaW4gTlZNIG9y
IGluIGluaXRpYWwgcmVndWxhdG9yIGNvbmZpZ3VyYXRpb24pCj4+Pgo+Pj4gwqDCoMKgwqDCoMKg
IHNvIHlvdSBoYXZlIG5vIHBvd2VyIGN5Y2xlIG9uIEREUiBkdXJpbmcgcmVzZXQuLi4KPj4+Cj4+
PiDCoMKgIMKgIMKgwqAgPT4gc29tZXRoaW5nIGlzIHdyb25nIGluIFBNSUMgY29uZmlndXJhdGlv
biBpbiBsaW51eCA/Cj4+Cj4+IFBvc3NpYmx5LCBidXQgdGhlbiBpdCBpcyBhbHNvIHNvbWV0aGlu
ZyB3cm9uZyBvbiBTVE0zMk1QMTU3QyBFVjEsIGJlY2F1c2UgSSBjYW4gcmVwcm9kdWNlIHRoZSBm
YWlsdXJlIG9uIEVWMSB0b28uIEkgc3BlY2lmaWNhbGx5IGRpZCBjaGVjayB0aGlzIG9uIHRoZSBF
VjEuIFBsZWFzZSBmaXggeW91ciBrZXJuZWwgY29uZmlnIGFuZCB0cnkgYWdhaW4sIHRoZW4geW91
IHNob3VsZCBiZSBhYmxlIHRvIHNlZSBpdCB5b3Vyc2VsZi4KPiAKPiBIYXMgdGhlcmUgYmVlbiBh
bnkgbmV3cyBvbiB0aGlzIGRlZmVjdCBvZiBFVjEgb3IgaGFzIHRoaXMgYmVlbiBpZ25vcmVkIGJ5
IFNUID8KCkhpIE1hcmVrCgpTb3JyeSBmb3IgdGhlIGRlbGF5LAoKUGF0Y2ggYXBwbGllZCBvbiBz
dG0zMi1tYXN0ZXIKClRoYW5rcwpQYXRyaWNlCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClVib290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBz
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==
