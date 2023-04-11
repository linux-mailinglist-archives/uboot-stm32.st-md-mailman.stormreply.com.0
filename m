Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B5BF6DD69E
	for <lists+uboot-stm32@lfdr.de>; Tue, 11 Apr 2023 11:29:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 65B7EC6B456;
	Tue, 11 Apr 2023 09:29:19 +0000 (UTC)
Received: from mout-u-204.mailbox.org (mout-u-204.mailbox.org [80.241.59.204])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B5A66C6B441
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Apr 2023 09:29:17 +0000 (UTC)
Received: from smtp202.mailbox.org (unknown [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-u-204.mailbox.org (Postfix) with ESMTPS id 4PwgXC408Jz9sX7;
 Tue, 11 Apr 2023 11:29:15 +0200 (CEST)
Message-ID: <be4b47c1-a6c5-badb-1f08-2a0d9f2f049a@denx.de>
Date: Tue, 11 Apr 2023 11:29:14 +0200
MIME-Version: 1.0
Content-Language: en-US
To: Lionel Debieve <lionel.debieve@foss.st.com>, u-boot@lists.denx.de
References: <20230405115313.v2.1.Ifbd51cee403b79546111ea80e1f9c3a0290c01dc@changeid>
From: Stefan Roese <sr@denx.de>
In-Reply-To: <20230405115313.v2.1.Ifbd51cee403b79546111ea80e1f9c3a0290c01dc@changeid>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH v2] watchdog: arm_smc_wdt: add watchdog
	support
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

SGkgTGlvbmVsLAoKT24gNC81LzIzIDExOjUzLCBMaW9uZWwgRGViaWV2ZSB3cm90ZToKPiBJbXBs
ZW1lbnQgYSBBUk0gU01DQ0MgYmFzZWQgZHJpdmVyIHRoYXQgYWxsb3cgdG8gdXNlCj4gYSBzZWN1
cmUgd2F0Y2hkb2cgb24gdGhlIHBsYXRmb3JtLgo+IAo+IFNpZ25lZC1vZmYtYnk6IExpb25lbCBE
ZWJpZXZlIDxsaW9uZWwuZGViaWV2ZUBmb3NzLnN0LmNvbT4KPiBSZXZpZXdlZC1ieTogUGF0cmlj
ayBEZWxhdW5heSA8cGF0cmljay5kZWxhdW5heUBmb3NzLnN0LmNvbT4KPiBUZXN0ZWQtYnk6IFBh
dHJpY2sgRGVsYXVuYXkgPHBhdHJpY2suZGVsYXVuYXlAZm9zcy5zdC5jb20+Cj4gLS0tCj4gCj4g
KG5vIGNoYW5nZXMgc2luY2UgdjEpCgpIbW0sIHRoaXMgZG9lcyBub3Qgc2VlbSB0byBiZSBjb3Jy
ZWN0LiBDb3VsZCB5b3UgcGxlYXNlIGluY2x1ZGUgdGhlIGxpc3QKb2YgY2hhbmdlZCBzdHVmZiBo
ZXJlIHRvIG1ha2UgcmV2aWV3aW5nIGVhc2llcj8KCk90aGVyIHRoYW4gdGhpczoKClJldmlld2Vk
LWJ5OiBTdGVmYW4gUm9lc2UgPHNyQGRlbnguZGU+CgpUaGFua3MsClN0ZWZhbgoKPiAgIGRyaXZl
cnMvd2F0Y2hkb2cvS2NvbmZpZyAgICAgICB8ICAgOCArKysKPiAgIGRyaXZlcnMvd2F0Y2hkb2cv
TWFrZWZpbGUgICAgICB8ICAgMSArCj4gICBkcml2ZXJzL3dhdGNoZG9nL2FybV9zbWNfd2R0LmMg
fCAxMjEgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gICAzIGZpbGVzIGNoYW5n
ZWQsIDEzMCBpbnNlcnRpb25zKCspCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy93YXRj
aGRvZy9hcm1fc21jX3dkdC5jCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvd2F0Y2hkb2cvS2Nv
bmZpZyBiL2RyaXZlcnMvd2F0Y2hkb2cvS2NvbmZpZwo+IGluZGV4IGI1YWM4ZjdmNTBkLi4zYTAz
NDFmNjA5ZCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3dhdGNoZG9nL0tjb25maWcKPiArKysgYi9k
cml2ZXJzL3dhdGNoZG9nL0tjb25maWcKPiBAQCAtMzUyLDYgKzM1MiwxNCBAQCBjb25maWcgV0RU
X1RBTkdJRVIKPiAgIAkgIEludGVsIFRhbmdpZXIgU29DLiBJZiB5b3UncmUgdXNpbmcgYSBib2Fy
ZCB3aXRoIEludGVsIFRhbmdpZXIKPiAgIAkgIFNvQywgc2F5IFkgaGVyZS4KPiAgIAo+ICtjb25m
aWcgV0RUX0FSTV9TTUMKPiArCWJvb2wgIkFSTSBTTUMgd2F0Y2hkb2cgdGltZXIgc3VwcG9ydCIK
PiArCWRlcGVuZHMgb24gV0RUICYmIEFSTV9TTUNDQwo+ICsJaW1wbHkgV0FUQ0hET0cKPiArCWhl
bHAKPiArCSAgU2VsZWN0IHRoaXMgdG8gZW5hYmxlIEFybSBTTUMgd2F0Y2hkb2cgdGltZXIuIFRo
aXMgd2F0Y2hkb2cgd2lsbCBtYW5hZ2UKPiArCSAgYSB3YXRjaGRvZyBiYXNlZCBvbiBBUk0gU01D
Q0MgY29tbXVuaWNhdGlvbi4KPiArCj4gICBjb25maWcgU1BMX1dEVAo+ICAgCWJvb2wgIkVuYWJs
ZSBkcml2ZXIgbW9kZWwgZm9yIHdhdGNoZG9nIHRpbWVyIGRyaXZlcnMgaW4gU1BMIgo+ICAgCWRl
cGVuZHMgb24gU1BMX0RNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvd2F0Y2hkb2cvTWFrZWZpbGUg
Yi9kcml2ZXJzL3dhdGNoZG9nL01ha2VmaWxlCj4gaW5kZXggNDQ2ZDk2MWQ3ZDIuLmE0NjMzYzBk
MmZhIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvd2F0Y2hkb2cvTWFrZWZpbGUKPiArKysgYi9kcml2
ZXJzL3dhdGNoZG9nL01ha2VmaWxlCj4gQEAgLTE4LDYgKzE4LDcgQEAgb2JqLSQoQ09ORklHXyQo
U1BMX1RQTF8pV0RUKSArPSB3ZHQtdWNsYXNzLm8KPiAgIG9iai0kKENPTkZJR19XRFRfU0FOREJP
WCkgKz0gc2FuZGJveF93ZHQubwo+ICAgb2JqLSQoQ09ORklHX1dEVF9BTEFSTV9TQU5EQk9YKSAr
PSBzYW5kYm94X2FsYXJtLXdkdC5vCj4gICBvYmotJChDT05GSUdfV0RUX0FQUExFKSArPSBhcHBs
ZV93ZHQubwo+ICtvYmotJChDT05GSUdfV0RUX0FSTV9TTUMpICs9IGFybV9zbWNfd2R0Lm8KPiAg
IG9iai0kKENPTkZJR19XRFRfQVJNQURBXzM3WFgpICs9IGFybWFkYS0zN3h4LXdkdC5vCj4gICBv
YmotJChDT05GSUdfV0RUX0FTUEVFRCkgKz0gYXN0X3dkdC5vCj4gICBvYmotJChDT05GSUdfV0RU
X0FTVDI2MDApICs9IGFzdDI2MDBfd2R0Lm8KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy93YXRjaGRv
Zy9hcm1fc21jX3dkdC5jIGIvZHJpdmVycy93YXRjaGRvZy9hcm1fc21jX3dkdC5jCj4gbmV3IGZp
bGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwMC4uNzBhYjk5YmRiZmIKPiAtLS0gL2Rl
di9udWxsCj4gKysrIGIvZHJpdmVycy93YXRjaGRvZy9hcm1fc21jX3dkdC5jCj4gQEAgLTAsMCAr
MSwxMjEgQEAKPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb3ItbGF0ZXIK
PiArLyoKPiArICogQVJNIFNlY3VyZSBNb25pdG9yIENhbGwgd2F0Y2hkb2cgZHJpdmVyCj4gKyAq
IENvcHlyaWdodCAoQykgMjAyMiwgU1RNaWNyb2VsZWN0cm9uaWNzIC0gQWxsIFJpZ2h0cyBSZXNl
cnZlZAo+ICsgKiBUaGlzIGZpbGUgaXMgYmFzZWQgb24gTGludXggZHJpdmVyIGRyaXZlcnMvd2F0
Y2hkb2cvYXJtX3NtY193ZHQuYwo+ICsgKi8KPiArCj4gKyNkZWZpbmUgTE9HX0NBVEVHT1JZIFVD
TEFTU19XRFQKPiArCj4gKyNpbmNsdWRlIDxkbS5oPgo+ICsjaW5jbHVkZSA8ZG0vZGV2aWNlX2Nv
bXBhdC5oPgo+ICsjaW5jbHVkZSA8bGludXgvYXJtLXNtY2NjLmg+Cj4gKyNpbmNsdWRlIDxsaW51
eC9wc2NpLmg+Cj4gKyNpbmNsdWRlIDx3ZHQuaD4KPiArCj4gKyNkZWZpbmUgRFJWX05BTUUJCSJh
cm1fc21jX3dkdCIKPiArCj4gKyNkZWZpbmUgV0RUX1RJTUVPVVRfU0VDUyhUSU1FT1VUKQkoKFRJ
TUVPVVQpIC8gMTAwMCkKPiArCj4gK2VudW0gc21jd2RfY2FsbCB7Cj4gKwlTTUNXRF9JTklUCQk9
IDAsCj4gKwlTTUNXRF9TRVRfVElNRU9VVAk9IDEsCj4gKwlTTUNXRF9FTkFCTEUJCT0gMiwKPiAr
CVNNQ1dEX1BFVAkJPSAzLAo+ICsJU01DV0RfR0VUX1RJTUVMRUZUCT0gNCwKPiArfTsKPiArCj4g
K3N0cnVjdCBzbWN3ZF9wcml2X2RhdGEgewo+ICsJdTMyIHNtY19pZDsKPiArCXVuc2lnbmVkIGlu
dCBtaW5fdGltZW91dDsKPiArCXVuc2lnbmVkIGludCBtYXhfdGltZW91dDsKPiArfTsKPiArCj4g
K3N0YXRpYyBpbnQgc21jd2RfY2FsbChzdHJ1Y3QgdWRldmljZSAqZGV2LCBlbnVtIHNtY3dkX2Nh
bGwgY2FsbCwKPiArCQkgICAgICB1bnNpZ25lZCBsb25nIGFyZywgc3RydWN0IGFybV9zbWNjY19y
ZXMgKnJlcykKPiArewo+ICsJc3RydWN0IHNtY3dkX3ByaXZfZGF0YSAqcHJpdiA9IGRldl9nZXRf
cHJpdihkZXYpOwo+ICsJc3RydWN0IGFybV9zbWNjY19yZXMgbG9jYWxfcmVzOwo+ICsKPiArCWlm
ICghcmVzKQo+ICsJCXJlcyA9ICZsb2NhbF9yZXM7Cj4gKwo+ICsJYXJtX3NtY2NjX3NtYyhwcml2
LT5zbWNfaWQsIGNhbGwsIGFyZywgMCwgMCwgMCwgMCwgMCwgcmVzKTsKPiArCj4gKwlpZiAocmVz
LT5hMCA9PSBQU0NJX1JFVF9OT1RfU1VQUE9SVEVEKQo+ICsJCXJldHVybiAtRU5PREVWOwo+ICsJ
aWYgKHJlcy0+YTAgPT0gUFNDSV9SRVRfSU5WQUxJRF9QQVJBTVMpCj4gKwkJcmV0dXJuIC1FSU5W
QUw7Cj4gKwlpZiAocmVzLT5hMCAhPSBQU0NJX1JFVF9TVUNDRVNTKQo+ICsJCXJldHVybiAtRUlP
Owo+ICsKPiArCXJldHVybiAwOwo+ICt9Cj4gKwo+ICtzdGF0aWMgaW50IHNtY3dkX3Jlc2V0KHN0
cnVjdCB1ZGV2aWNlICpkZXYpCj4gK3sKPiArCXJldHVybiBzbWN3ZF9jYWxsKGRldiwgU01DV0Rf
UEVULCAwLCBOVUxMKTsKPiArfQo+ICsKPiArc3RhdGljIGludCBzbWN3ZF9zdG9wKHN0cnVjdCB1
ZGV2aWNlICpkZXYpCj4gK3sKPiArCXJldHVybiBzbWN3ZF9jYWxsKGRldiwgU01DV0RfRU5BQkxF
LCAwLCBOVUxMKTsKPiArfQo+ICsKPiArc3RhdGljIGludCBzbWN3ZF9zdGFydChzdHJ1Y3QgdWRl
dmljZSAqZGV2LCB1NjQgdGltZW91dF9tcywgdWxvbmcgZmxhZ3MpCj4gK3sKPiArCXN0cnVjdCBz
bWN3ZF9wcml2X2RhdGEgKnByaXYgPSBkZXZfZ2V0X3ByaXYoZGV2KTsKPiArCXU2NCB0aW1lb3V0
X3NlYyA9IFdEVF9USU1FT1VUX1NFQ1ModGltZW91dF9tcyk7Cj4gKwlpbnQgZXJyOwo+ICsKPiAr
CWlmICh0aW1lb3V0X3NlYyA8IHByaXYtPm1pbl90aW1lb3V0IHx8IHRpbWVvdXRfc2VjID4gcHJp
di0+bWF4X3RpbWVvdXQpCXsKPiArCQlkZXZfZXJyKGRldiwgIlRpbWVvdXQgdmFsdWUgbm90IHN1
cHBvcnRlZFxuIik7Cj4gKwkJcmV0dXJuIC1FSU5WQUw7Cj4gKwl9Cj4gKwo+ICsJZXJyID0gc21j
d2RfY2FsbChkZXYsIFNNQ1dEX1NFVF9USU1FT1VULCB0aW1lb3V0X3NlYywgTlVMTCk7Cj4gKwlp
ZiAoZXJyKSB7Cj4gKwkJZGV2X2VycihkZXYsICJUaW1lb3V0IG91dCBjb25maWd1cmF0aW9uIGZh
aWxlZFxuIik7Cj4gKwkJcmV0dXJuIGVycjsKPiArCX0KPiArCj4gKwlyZXR1cm4gc21jd2RfY2Fs
bChkZXYsIFNNQ1dEX0VOQUJMRSwgMSwgTlVMTCk7Cj4gK30KPiArCj4gK3N0YXRpYyBpbnQgc21j
d2RfcHJvYmUoc3RydWN0IHVkZXZpY2UgKmRldikKPiArewo+ICsJc3RydWN0IHNtY3dkX3ByaXZf
ZGF0YSAqcHJpdiA9IGRldl9nZXRfcHJpdihkZXYpOwo+ICsJc3RydWN0IGFybV9zbWNjY19yZXMg
cmVzOwo+ICsJaW50IGVycjsKPiArCj4gKwlwcml2LT5zbWNfaWQgPSBkZXZfcmVhZF91MzJfZGVm
YXVsdChkZXYsICJhcm0sc21jLWlkIiwgMHg4MjAwM0QwNik7Cj4gKwo+ICsJZXJyID0gc21jd2Rf
Y2FsbChkZXYsIFNNQ1dEX0lOSVQsIDAsICZyZXMpOwo+ICsJaWYgKGVyciA8IDApCj4gKwkJcmV0
dXJuIGVycjsKPiArCj4gKwlwcml2LT5taW5fdGltZW91dCA9IHJlcy5hMTsKPiArCXByaXYtPm1h
eF90aW1lb3V0ID0gcmVzLmEyOwo+ICsKPiArCXJldHVybiAwOwo+ICt9Cj4gKwo+ICtzdGF0aWMg
Y29uc3Qgc3RydWN0IHdkdF9vcHMgc21jd2Rfb3BzID0gewo+ICsJLnN0YXJ0CQk9IHNtY3dkX3N0
YXJ0LAo+ICsJLnN0b3AJCT0gc21jd2Rfc3RvcCwKPiArCS5yZXNldAkJPSBzbWN3ZF9yZXNldCwK
PiArfTsKPiArCj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgdWRldmljZV9pZCBzbWN3ZF9kdF9pZHNb
XSA9IHsKPiArCXsgLmNvbXBhdGlibGUgPSAiYXJtLHNtYy13ZHQiIH0sCj4gKwl7fQo+ICt9Owo+
ICsKPiArVV9CT09UX0RSSVZFUih3ZHRfc2FuZGJveCkgPSB7Cj4gKwkubmFtZSA9ICJzbWN3ZCIs
Cj4gKwkuaWQgPSBVQ0xBU1NfV0RULAo+ICsJLm9mX21hdGNoID0gc21jd2RfZHRfaWRzLAo+ICsJ
LnByaXZfYXV0byA9IHNpemVvZihzdHJ1Y3Qgc21jd2RfcHJpdl9kYXRhKSwKPiArCS5wcm9iZSA9
IHNtY3dkX3Byb2JlLAo+ICsJLm9wcyA9ICZzbWN3ZF9vcHMsCj4gK307CgpWaWVsZSBHcsO8w59l
LApTdGVmYW4gUm9lc2UKCi0tIApERU5YIFNvZnR3YXJlIEVuZ2luZWVyaW5nIEdtYkgsICAgICAg
TWFuYWdpbmcgRGlyZWN0b3I6IEVyaWthIFVudGVyCkhSQiAxNjUyMzUgTXVuaWNoLCBPZmZpY2U6
IEtpcmNoZW5zdHIuNSwgRC04MjE5NCBHcm9lYmVuemVsbCwgR2VybWFueQpQaG9uZTogKCs0OSkt
ODE0Mi02Njk4OS01MSBGYXg6ICgrNDkpLTgxNDItNjY5ODktODAgRW1haWw6IHNyQGRlbnguZGUK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3Rt
MzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20K
aHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJv
b3Qtc3RtMzIK
