Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 502CE4B670B
	for <lists+uboot-stm32@lfdr.de>; Tue, 15 Feb 2022 10:10:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0A59CC5F1F2;
	Tue, 15 Feb 2022 09:10:40 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 22910C5F1D7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Feb 2022 09:10:38 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 21F860Nr027780;
 Tue, 15 Feb 2022 10:10:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=mwH5DGdEvBB3sSqoNB4IfZyhARTilPuN65KnaPwXlFk=;
 b=6NuXSbsujxoZXqugQWLw2JRYxLmEuNq7RwGZtBCw6fRLozv9HNPEHvFp/7hTA8LW/0ja
 vUxLonuW646+6XFR/T77/3lECiuMxqemlwNYYeN4dyw4wRKqWPE1K4jxt5nXReR+O9f6
 A0TKt3nkrRbzV3EgmTD+LLgXEHtZlxNhmQqXJA4AVBKvJu9Xs3kBzcu3ri2yzx9z+ZxI
 zlv+/FVpKzKuI5YAo0Tjqs4dPdt59IIivVcANCVE9Iq/IbP8zpW0xdx91jWugg/Tkyr1
 LWGPjazaMmoNpvpsDfSi8ozTr7uaF4ApqJCvE9xBN/d4jdREkB8peKChw9dktOgJlPR5 Ug== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3e7rq552jh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Feb 2022 10:10:26 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D08C910002A;
 Tue, 15 Feb 2022 10:10:25 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BEA00216ED1;
 Tue, 15 Feb 2022 10:10:25 +0100 (CET)
Received: from [10.211.3.180] (10.75.127.45) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Tue, 15 Feb
 2022 10:10:25 +0100
Message-ID: <adefaa67-007e-b04a-1745-ace5ec475a33@foss.st.com>
Date: Tue, 15 Feb 2022 10:10:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Sean Anderson <seanga2@gmail.com>, <u-boot@lists.denx.de>
References: <20220131161811.1.Ifa06360115ffa3f3307372e6cdd98ec16759d6ba@changeid>
 <9bc062e3-673e-11e5-137c-1e2bf9651904@gmail.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <9bc062e3-673e-11e5-137c-1e2bf9651904@gmail.com>
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-15_03,2022-02-14_04,2021-12-02_01
Cc: Tero Kristo <t-kristo@ti.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Lukasz Majewski <lukma@denx.de>, Tero Kristo <kristo@kernel.org>
Subject: Re: [Uboot-stm32] [PATCH] clk: update clk_clean_rate_cache to use
 private clk struct
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

SGkgU2VhbgoKT24gMi8xLzIyIDE2OjE0LCBTZWFuIEFuZGVyc29uIHdyb3RlOgo+IE9uIDEvMzEv
MjIgMTA6MTggQU0sIFBhdHJpY2sgRGVsYXVuYXkgd3JvdGU6Cj4+IEluIGNsa19jbGVhbl9yYXRl
X2NhY2hlLCBjbGstPnJhdGUgc2hvdWxkIHVwZGF0ZSB0aGUgcHJpdmF0ZSBjbG9jawo+PiBzdHJ1
Y3QsIGluIHBhcnRpY3VsYXIgd2hlbiBDQ0YgaXMgYWN0aXZhdGVkLCB0byBzYXZlIHRoZSBjYWNo
ZWQKPj4gcmF0ZSB2YWx1ZS4KPj4KPj4gV2hlbiBjbGtfZ2V0X3BhcmVudF9yYXRlIGlzIGNhbGxl
ZCwgdGhlIGNhY2hlZCBpbmZvcm1hdGlvbgo+PiBpcyByZWFkIGZyb20gcGNsay0+cmF0ZSwgd2l0
aCBwY2xrID0gY2xrX2dldF9wYXJlbnQoY2xrKS4KPj4KPj4gQXMgdGhlIGNhY2hlZCBpcyByZWFk
IGZyb20gcHJpdmF0ZSBjbGsgZGF0YSwgdGhlIHVwZGF0ZSBzaG91bGQKPj4gYmUgZG9uZSBhbHNv
IG9uIGl0Lgo+Pgo+PiBGaXhlczogNmI3ZmQzMTI4ZjcgKCJjbGs6IGZpeCBzZXRfcmF0ZSB0byBj
bGVhbiB1cCBjYWNoZWQgcmF0ZXMgZm9yIAo+PiB0aGUgaGllcmFyY2h5IikKPj4gU2lnbmVkLW9m
Zi1ieTogUGF0cmljayBEZWxhdW5heSA8cGF0cmljay5kZWxhdW5heUBmb3NzLnN0LmNvbT4KPj4g
LS0tCj4+Cj4+IMKgIGRyaXZlcnMvY2xrL2Nsay11Y2xhc3MuYyB8IDIwICsrKysrKysrKysrKysr
KysrKystCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsay9jbGstdWNsYXNzLmMgYi9kcml2ZXJz
L2Nsay9jbGstdWNsYXNzLmMKPj4gaW5kZXggZDI0NWI2NzJmYS4uNjIzOTNiNzNlMSAxMDA2NDQK
Pj4gLS0tIGEvZHJpdmVycy9jbGsvY2xrLXVjbGFzcy5jCj4+ICsrKyBiL2RyaXZlcnMvY2xrL2Ns
ay11Y2xhc3MuYwo+PiBAQCAtNTc2LDYgKzU3NiwyMSBAQCB1bG9uZyBjbGtfcm91bmRfcmF0ZShz
dHJ1Y3QgY2xrICpjbGssIHVsb25nIHJhdGUpCj4+IMKgwqDCoMKgwqAgcmV0dXJuIG9wcy0+cm91
bmRfcmF0ZShjbGssIHJhdGUpOwo+PiDCoCB9Cj4+IMKgICtzdGF0aWMgdm9pZCBjbGtfZ2V0X3By
aXYoc3RydWN0IGNsayAqY2xrLCBzdHJ1Y3QgY2xrICoqY2xrcCkKPj4gK3sKPj4gK8KgwqDCoCAq
Y2xrcCA9IE5VTEw7Cj4+ICsKPj4gK8KgwqDCoCAvKiBnZXQgcHJpdmF0ZSBjbG9jayBzdHJ1Y3Qg
YXNzb2NpYXRlZCB0byB0aGUgcHJvdmlkZWQgY2xvY2sgKi8KPj4gK8KgwqDCoCBpZiAoQ09ORklH
X0lTX0VOQUJMRUQoQ0xLX0NDRikpIHsKPj4gK8KgwqDCoMKgwqDCoMKgIC8qIFRha2UgaWQgMCBh
cyBhIG5vbi12YWxpZCBjbGssIHN1Y2ggYXMgZHVtbXkgKi8KPj4gK8KgwqDCoMKgwqDCoMKgIGlm
IChjbGstPmlkKQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjbGtfZ2V0X2J5X2lkKGNsay0+
aWQsIGNsa3ApOwo+PiArwqDCoMKgIH0gZWxzZSB7Cj4+ICvCoMKgwqDCoMKgwqDCoCAqY2xrcCA9
IGRldl9nZXRfY2xrX3B0cihjbGstPmRldik7Cj4+ICvCoMKgwqAgfQo+Cj4gRG9lcyB0aGlzIGV2
ZW4gZG8gYW55dGhpbmcgd2l0aG91dCBDQ0Y/IEFGQUlLIHRob3NlIGNsb2NrcyBhcmUgdGhlIG9u
bHkKPiBvbmVzIHdoaWNoIG1pcnJvciB0aGUgY2xvY2sgc3RydWN0dXJlIGluIHVkZXZpY2VzIGFu
ZCBrZWVwIHRoZWlyICJyZWFsIgo+IHN0cnVjdCBjbG9jayBhcyB0aGVpciBwcml2YXRlIGRhdGEu
IElNTyB0aGlzIHdob2xlIHN5c3RlbSBpcyBicm9rZW4KPiBiZWNhdXNlIG1vc3QgZHJpdmVycyBk
byBub3Qvc2hvdWxkIG5vdCBkbyB0aGlzLgoKSSB0YWtlIHNvbWUgdGltZSB0byBmb2xsb3cgdGhl
IGNsayBzdHJ1Y3QgbWFuYWdlbWVudCBpbiBjbGsgVS1DbGFzcyB3aXRoCgoodGhlIGNsayBzdHJ1
Y3QgaXMgaW4gcHJpdmF0ZSBkYXRhIG9mIFUtQ2xhc3MpIG9yIHdpdGhvdXQgQ0NGCgoodGhlIGNs
b2NrIHByb3ZpZGVyIGRvbid0IG1hbmFnZSBwcml2YXRlIGRhdGEgPSBjbGsgc3RydWN0IGlzIGFs
bG9jYXRlZCBieQoKY2xrIEFQSSBjYWxsZXIpLgoKCkluIHBhcnRpY3VsYXIsIEkgY2hlY2sgdGhl
IGNsb2NrIGlkZW50aWZpZXIgYW5kIGhvdyB0byBiZSBzdXJlIHdpdGggQ0NGIAp0aGF0IHRoZQoK
aWRlbnRpZmllciBpcyB1bmlxdWUgZm9yIGFsbCBjbG9jayBwcm92aWRlciAoY2bCoCBjbGtfZ2V0
X2J5X2lkKSBhbmQgdGhlIApGSVhNRQoKY29tbWVudCBpbiBjbGtfcmVnaXN0ZXIoKSBhYm91dCBk
ZXZfc2V0X3VjbGFzc19wcml2LgoKCkJ1dCB5ZXMgLCBpbsKgIHRoaXMgaW4gdGhpcyBmdW5jdGlv
biBJIHRoaW5rLCBJIG5lZWQgdG8gY2hhbmdlIHRoZSBlbHNlIApjYXNlIHRvCgoKK8KgwqDCoCB9
IGVsc2UgewoKK8KgwqDCoMKgwqDCoMKgICpjbGtwID0gY2xrOworwqDCoMKgIH0KCgp0byBhdm9p
ZCBpc3N1ZSB3aXRoIG90aGVyIGRyaXZlcnMgd2l0aG91dCBDQ0YuCgoKPgo+IC0tU2Vhbgo+Cj4+
ICt9Cj4+ICsKPj4gKy8qIGNsZWFuIGNhY2hlLCBjYWxsZWQgd2l0aCBwcml2YXRlIGNsb2NrIHN0
cnVjdCAqLwo+PiDCoCBzdGF0aWMgdm9pZCBjbGtfY2xlYW5fcmF0ZV9jYWNoZShzdHJ1Y3QgY2xr
ICpjbGspCj4+IMKgIHsKPj4gwqDCoMKgwqDCoCBzdHJ1Y3QgdWRldmljZSAqY2hpbGRfZGV2Owo+
PiBAQCAtNTk1LDYgKzYxMCw3IEBAIHN0YXRpYyB2b2lkIGNsa19jbGVhbl9yYXRlX2NhY2hlKHN0
cnVjdCBjbGsgKmNsaykKPj4gwqAgdWxvbmcgY2xrX3NldF9yYXRlKHN0cnVjdCBjbGsgKmNsaywg
dWxvbmcgcmF0ZSkKPj4gwqAgewo+PiDCoMKgwqDCoMKgIGNvbnN0IHN0cnVjdCBjbGtfb3BzICpv
cHM7Cj4+ICvCoMKgwqAgc3RydWN0IGNsayAqY2xrcDsKPj4gwqAgwqDCoMKgwqDCoCBkZWJ1Zygi
JXMoY2xrPSVwLCByYXRlPSVsdSlcbiIsIF9fZnVuY19fLCBjbGssIHJhdGUpOwo+PiDCoMKgwqDC
oMKgIGlmICghY2xrX3ZhbGlkKGNsaykpCj4+IEBAIC02MDQsOCArNjIwLDEwIEBAIHVsb25nIGNs
a19zZXRfcmF0ZShzdHJ1Y3QgY2xrICpjbGssIHVsb25nIHJhdGUpCj4+IMKgwqDCoMKgwqAgaWYg
KCFvcHMtPnNldF9yYXRlKQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FTk9TWVM7Cj4+
IMKgICvCoMKgwqAgLyogZ2V0IHByaXZhdGUgY2xvY2sgc3RydWN0IHVzZWQgZm9yIGNhY2hlICov
Cj4+ICvCoMKgwqAgY2xrX2dldF9wcml2KGNsaywgJmNsa3ApOwo+PiDCoMKgwqDCoMKgIC8qIENs
ZWFuIHVwIGNhY2hlZCByYXRlcyBmb3IgdXMgYW5kIGFsbCBjaGlsZCBjbG9ja3MgKi8KPj4gLcKg
wqDCoCBjbGtfY2xlYW5fcmF0ZV9jYWNoZShjbGspOwo+PiArwqDCoMKgIGNsa19jbGVhbl9yYXRl
X2NhY2hlKGNsa3ApOwo+PiDCoCDCoMKgwqDCoMKgIHJldHVybiBvcHMtPnNldF9yYXRlKGNsaywg
cmF0ZSk7Cj4+IMKgIH0KPj4KPgoKUmVnYXJkcwoKClBhdHJpY2sKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClVib290LXN0bTMyIG1haWxpbmcgbGlzdApV
Ym9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==
