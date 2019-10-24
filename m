Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C82E3D75
	for <lists+uboot-stm32@lfdr.de>; Thu, 24 Oct 2019 22:44:07 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DFD9DC36B0A
	for <lists+uboot-stm32@lfdr.de>; Thu, 24 Oct 2019 20:44:06 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 29C21C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Oct 2019 20:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1571949835;
 bh=jfqCWyWG0c2vwqXmn/3ZBxC7YK4m3+dviS9WRe0g1qo=;
 h=X-UI-Sender-Class:Subject:To:References:From:Date:In-Reply-To;
 b=lQaQOw7EI6bdPcOF3Pi3VZ6yn9JgBQEwD6fcuuHRC8qoMpwnR3aVyK9GznR8Hh8QF
 2Unv89d7brDLZ5TWvP4k8ry0ijPFL0xDvO5aH/fM6S+fKMJ4+o+McMluKcTfCblPHP
 OoiWnuCXhx/KxB3VSVNSSGgdeWnAJlZjntH1Ld04=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.123.51] ([94.114.42.168]) by mail.gmx.com (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MAwbp-1iHRNC17s1-00BNJz; Thu, 24
 Oct 2019 22:43:55 +0200
To: Patrice CHOTARD <patrice.chotard@st.com>,
 Yannick FERTRE <yannick.fertre@st.com>, Vikas MANOCHA
 <vikas.manocha@st.com>, Benjamin GAIGNARD <benjamin.gaignard@st.com>,
 Albert Aribaud <albert.u.boot@aribaud.net>,
 Patrick DELAUNAY <patrick.delaunay@st.com>, Simon Glass <sjg@chromium.org>,
 Anatolij Gustschin <agust@denx.de>, Philippe CORNU <philippe.cornu@st.com>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 Eugen Hristev <eugen.hristev@microchip.com>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>
References: <1570454955-21298-1-git-send-email-yannick.fertre@st.com>
 <1570454955-21298-2-git-send-email-yannick.fertre@st.com>
 <2d9bb18b-5775-00b6-2fdd-1b38dce1abcc@gmx.de>
 <2ef8752e-a6fd-fec3-ad94-63dcc48fdc13@st.com>
From: Heinrich Schuchardt <xypron.glpk@gmx.de>
Message-ID: <721d8c58-9ba4-6b86-133e-f0a1d4c3de94@gmx.de>
Date: Thu, 24 Oct 2019 22:43:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <2ef8752e-a6fd-fec3-ad94-63dcc48fdc13@st.com>
Content-Language: en-US
X-Provags-ID: V03:K1:OMFbF2XD4qFAuU4x+ZRDZNf0PxsuFSXjgjlmkLD6nADcS6LJfFg
 MyF0ClwwFA3T5YJED/9Mrfri6+05uciQEa/qaZlldohJdd5C+3vy/h3z3lE0FdET8/ShEnt
 z+Y4UCfGW/0+bw0Js2Of0xNdblejaZJqYU+2ASZ9h/SkgtKR85vTa71UIY6SSW3oriwBqZM
 KTM5mKLj2v+K0MOVr6Fhg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:skMCvEDg9g8=:+lZD23wgtaKBlJ/vnQDQEV
 sssE2EmwTyoeMfDiHCp7x1X8vRld9szDIPjX/9RKRU6XiuRRpQi6VeeG5iXdu86tu7eAupzJU
 JJdRCF42j6peD5GDtpl0mNmCld+bjg9ZBvtiIsIGW2YY8YsRrncyk//nqYg6PnXm2zbmH7I8W
 dQADn2KLEYBBo58zrrylrS+J2/PHhgvDpPRiPoWLCUYoomhyCGyE7AENrr9fVOtVMSzFiIRab
 C29033NEMi3yEPo9ki7z05Vcv8ImJxGn1nCrj3dn6Kklmyj+ZNsOvTmYvxbIf4ppg2mBm/bFR
 oW9vf7FtZVxEzl9bE/vUf7ueBKaf7LXi+8vhZ0SsmGiyYRB394qqOJK4b9CHrQ3eaN5wdqupm
 G29Pbt64ZDJ/s/a0T2FZ4mu690GjRIxykqPg0fPss+LQIfV2OmwiqLhb5vnxvz39y4BO+/8II
 26w5/vaEz48K07f+uZnmw/9WeD+tOooGbYDgchegjHcx5lErsx0H6aD0K9zmgnbVd07yctrQn
 du+nwCc7A8yXhBlzejiln+gN/cka1YAjEook+pOPSzA0tkbqhQeKu5g3Ez4JPY5VoQCufliYr
 IgkbzIa/r8q/12s5CuE/+iIkgA/GUzBtEg/QMwQE0C3muWbcKgMkyfCeZCDB+/UJZkBG1rVVg
 3+KFwBZ0UcJH/d/SaH4F7hrDOpGo86vs7IjWDJiYuI96VRtyh1Dn6dpuLIebHXoGQVWJUb4R6
 +84iT8da7dd8L5l6c00aAVI3ZbVNX574f6QkS5tIx75NibWkKzSMMZBPbKHrT2mFuVUdN6E5I
 FoUozabQeVF9BLmA+kpCP/Wzyw/7GO9G5IZqIUwQzqIHoIulZaB2blCAhKaOx08EiLg3rWKih
 ujtDMP/Rg1IEmhBbplxKrFTf1cnotR8pKEGRoktU/YncD/ROZxixmw2Q3YV7lABu8kERi8iwy
 JuW+fCfe+X84zGC0dq+0KRVle9CoygmbvmG3clgRoSwGwMQCuDsTt5EC4r6zxBFZEbVegPTpa
 DCQQQUzqjZSS0uW+UGq81iTgWBX0e29xwcI5flLvYERmrnpv5azv3Aw+9R0UAzAKzZV0ha2F8
 fHg6oWczxO/Qjol1ZitIdLZMSIUqndlv3EahEiK2/d1GOqcaMz0vl1BeAAs09RgLdW9rI8HPo
 qZB0bA0NpNDz3TzLJe5AWbz6deWMHmGLxfd+1AYSYnlnYnqnT7Kcnd1Wu3WAf2zbljrMwqbpc
 ylS6qFnqDQ4VC+IEat3vPprm1jJL6MzsDwPuvzzEvjzTwdndY9q3XcLLBY84=
Subject: Re: [Uboot-stm32] [PATCH v5 01/15] video: bmp: check resolutions of
	panel/bitmap
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

T24gMTAvMjQvMTkgNDowNSBQTSwgUGF0cmljZSBDSE9UQVJEIHdyb3RlOgo+IEhpIEhlaW5yaWNo
LCBhbGwKPgo+IE9uIDEwLzcvMTkgNzozNCBQTSwgSGVpbnJpY2ggU2NodWNoYXJkdCB3cm90ZToK
Pj4gT24gMTAvNy8xOSAzOjI5IFBNLCBZYW5uaWNrIEZlcnRyw6kgd3JvdGU6Cj4+PiBJZiB0aGUg
c2l6ZSBvZiB0aGUgYml0bWFwIGlzIGJpZ2dlciB0aGFuIHRoZSBzaXplIG9mCj4+PiB0aGUgcGFu
ZWwgdGhlbiBlcnJvcnMgYXBwZWFyIHdoZW4gY2FsY3VsYXRpbmcgYXhpcyBhbGlnbm1lbnQKPj4+
IGFuZCB0aGUgY29weSBvZiBiaXRtYXAgaXMgZG9uZSBvdXRzaWRlIG9mIGZyYW1lYnVmZmVyLgo+
Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IFlhbm5pY2sgRmVydHLDqSA8eWFubmljay5mZXJ0cmVAc3Qu
Y29tPgo+Pj4gLS0tCj4+PiAgwqAgZHJpdmVycy92aWRlby92aWRlb19ibXAuYyB8IDcgKysrKysr
Kwo+Pj4gIMKgIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykKPj4+Cj4+PiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy92aWRlby92aWRlb19ibXAuYyBiL2RyaXZlcnMvdmlkZW8vdmlkZW9fYm1w
LmMKPj4+IGluZGV4IDE5M2YzN2QuLjRhZjFmYjQgMTAwNjQ0Cj4+PiAtLS0gYS9kcml2ZXJzL3Zp
ZGVvL3ZpZGVvX2JtcC5jCj4+PiArKysgYi9kcml2ZXJzL3ZpZGVvL3ZpZGVvX2JtcC5jCj4+PiBA
QCAtMjQ5LDYgKzI0OSwxMyBAQCBpbnQgdmlkZW9fYm1wX2Rpc3BsYXkoc3RydWN0IHVkZXZpY2Ug
KmRldiwgdWxvbmcgYm1wX2ltYWdlLCBpbnQgeCwgaW50IHksCj4+Pgo+Pj4gIMKgwqDCoMKgwqAg
cGFkZGVkX3dpZHRoID0gKHdpZHRoICYgMHgzID8gKHdpZHRoICYgfjB4MykgKyA0IDogd2lkdGgp
Owo+Pj4KPj4+ICvCoMKgwqAgLyogY2hlY2sgaWYgcGljdHVyZSBzaXplIGV4Y2VlZHMgcGFuZWwg
c2l6ZSAqLwo+Pj4gK8KgwqDCoCBpZiAoKHB3aWR0aCA8IHdpZHRoKSB8fCAocHJpdi0+eXNpemUg
PCBoZWlnaHQpKSB7Cj4+PiArwqDCoMKgwqDCoMKgwqAgcHJpbnRmKCJFcnJvcjogQk1QIHNpemUg
JWQgeCAlZCBpcyBiaWdnZXIgdGhhbiBwYW5lbCBzaXplICVkIHggJWRcbiIsCj4+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAoaW50KXdpZHRoLCAoaW50KWhlaWdodCwgcHJpdi0+eHNp
emUsIHByaXYtPnlzaXplKTsKPj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVJTlZBTDsKPj4+
ICvCoMKgwqAgfQo+Pj4gKwo+Pj4gIMKgwqDCoMKgwqAgaWYgKGFsaWduKSB7Cj4+PiAgwqDCoMKg
wqDCoMKgwqDCoMKgIHZpZGVvX3NwbGFzaF9hbGlnbl9heGlzKCZ4LCBwcml2LT54c2l6ZSwgd2lk
dGgpOwo+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoCB2aWRlb19zcGxhc2hfYWxpZ25fYXhpcygmeSwg
cHJpdi0+eXNpemUsIGhlaWdodCk7Cj4+Cj4+IFRoaXMgaXMgZm9sbG93ZWQgYnk6Cj4+Cj4+ICDC
oMKgwqDCoMKgwqDCoCBpZiAoKHggKyB3aWR0aCkgPiBwd2lkdGgpCj4+ICDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoHdpZHRoID0gcHdpZHRoIC0geDsKPj4gIMKgwqDCoMKgwqDCoMKg
wqBpZiAoKHkgKyBoZWlnaHQpID4gcHJpdi0+eXNpemUpCj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoGhlaWdodCA9IHByaXYtPnlzaXplIC0geTsKPj4KPj4gVGhlc2UgbGluZXMg
d2lsbCBjbGlwIGEgYml0bWFwIHRoYXQgZ2l2ZW4gdGhlIGxlZnQgdXBwZXIgY29ybmVyIHgsIHkK
Pj4gZG9lcyBub3QgZml0IG9udG8gdGhlIHNjcmVlbi4KPj4KPj4gU28gaXNuJ3QgdGhpcyBwYXRj
aCBzdXBlcmZsdW91cz8KPj4KPj4gV2hhdCBpcyBtaXNzaW5nIGFyZSBjaGVja3MgZm9yIHggYW5k
IHkuCj4+Cj4+IEZvciB0ZXN0aW5nIEkgaGF2ZSB1c2VkIHFlbXVfeDg2IGFuZCBhZGRlZAo+Pgo+
PiAgwqDCoMKgICNkZWZpbmUgQ09ORklHX0JNUF8yNEJQUCB5Cj4+Cj4+IHRvIHRoZSB0b3Agb2Yg
ZHJpdmVycy92aWRlby92aWRlb19ibXAuYyBhbmQgbG9hZGVkIGEgMjRiaXQgYml0bWFwLgo+Pgo+
PiBDbGlwcGluZyB3b3JrcyBhcyBleHBlY3RlZC4gQnV0IHBhc3NpbmcgYSB2YWx1ZSBvZiB4IGV4
Y2VlZGluZyB0aGUKPj4gc2NyZWVuIHdpZHRoIGxlYWQgdG8gYSBjcmFzaC4KPj4KPj4gV2hhdCBJ
IHJlYWxseSBkaXNsaWtlIGluIHRoZSBleGlzdGluZyBjb2RpbmcgaXMgdGhhdCBDT05GSUdfQk1Q
XypCUFAgaXMKPj4gZGVmaW5lZCBpbiBpbmNsdWRlcyBpbnN0ZWFkIG9mIHVzaW5nIEtjb25maWcg
YnV0IHRoYXQgaXMgYSBkaWZmZXJlbnQgc3RvcnkuCj4+Cj4+IEJlc3QgcmVnYXJkcwo+Pgo+PiBI
ZWlucmljaAo+Cj4gRm9yIGluZm9ybWF0aW9uIGFsbCB0aGlzIHNlcmllcyBwYXRjaGVzIGhhdmUg
YmVlbiBhcHBsaWVkIG9uIHUtYm9vdC9tYXN0ZXIgZXhjZXB0c8KgIHRoaXMgb25lLgo+Cj4gVW5m
b3J0dW5hdGVseSwgd2l0aG91dCB0aGlzIHBhdGNoLCBzdG0zMmY3NDYtZGlzY292ZXJ5IGJvYXJk
IGRvZXNuJ3QgYm9vdCBhbnltb3JlLgoKSSBzdGlsbCBkbyBub3QgdW5kZXJzdGFuZCB3aHkgdGhp
cyBwYXRjaCBpcyBuZWVkZWQuCgpDb3VsZCB5b3UsIHBsZWFzZSwgdHJ5IHRvIGFuYWx5emUgd2h5
IHRoZSBib2FyZCBkb2VzIG5vdCBib290LgoKV2hhdCBpcyB3cm9uZyB3aXRoIHRoZSBleGlzdGlu
ZyBjb2RlIGZvciBjbGlwcGluZz8KT3IgaXMgdGhlIG5vbi1ib290aW5nIGp1c3QgY29pbmNpZGVu
Y2UgYnV0IHRoZSBidWcgaXMgc29tZXdoZXJlIGVsc2U/CgpXaGF0IGFyZSB0aGUgdmFsdWVzIG9m
IHRoZSBwYXJhbWV0ZXJzIHBhc3NlZCB0byB2aWRlb19ibXBfZGlzcGxheSgpPwpXaGljaCBiaXRt
YXAgZmlsZSBhcmUgeW91IHVzaW5nPwpXaGF0IGlzIHRoZSBzaXplIG9mIHRoZSBkaXNwbGF5PwoK
QmVzdCByZWdhcmRzCgpIZWlucmljaAoKPgo+IEhlaW5yaWNoLCBjb3VsZCB0aGlzIHBhdGNoIGJl
IG1lcmdlZCwgd2FpdGluZyBmb3IgYSBjbGVhbiBwYXRjaCBmcm9tIFlhbm5pY2sgPwo+Cj4gUmVn
YXJkcwo+Cj4gUGF0cmljZQo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20v
bWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
