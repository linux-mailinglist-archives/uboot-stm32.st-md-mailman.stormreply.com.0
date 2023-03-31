Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A816D1924
	for <lists+uboot-stm32@lfdr.de>; Fri, 31 Mar 2023 09:59:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8272CC64107;
	Fri, 31 Mar 2023 07:59:52 +0000 (UTC)
Received: from mout-u-204.mailbox.org (mout-u-204.mailbox.org [80.241.59.204])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EF2FAC62EFE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Mar 2023 07:59:51 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-u-204.mailbox.org (Postfix) with ESMTPS id 4Pnt454sxNz9sQm;
 Fri, 31 Mar 2023 09:59:49 +0200 (CEST)
Message-ID: <537d68ca-6efd-bbdd-8ada-07784dd0bfb9@denx.de>
Date: Fri, 31 Mar 2023 09:59:48 +0200
MIME-Version: 1.0
To: Lionel Debieve <lionel.debieve@foss.st.com>, u-boot@lists.denx.de
References: <20230331091422.1.Ifbd51cee403b79546111ea80e1f9c3a0290c01dc@changeid>
Content-Language: en-US
From: Stefan Roese <sr@denx.de>
In-Reply-To: <20230331091422.1.Ifbd51cee403b79546111ea80e1f9c3a0290c01dc@changeid>
X-Rspamd-Queue-Id: 4Pnt454sxNz9sQm
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH] watchdog: arm_smc_wdt: add watchdog
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

SGkgTGlvbmVsLAoKT24gMy8zMS8yMyAwOToxNCwgTGlvbmVsIERlYmlldmUgd3JvdGU6Cj4gSW1w
bGVtZW50IGEgQVJNIFNNQ0NDIGJhc2VkIGRyaXZlciB0aGF0IGFsbG93IHRvIHVzZQo+IGEgc2Vj
dXJlIHdhdGNoZG9nIG9uIHRoZSBwbGF0Zm9ybS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBMaW9uZWwg
RGViaWV2ZSA8bGlvbmVsLmRlYmlldmVAZm9zcy5zdC5jb20+Cj4gLS0tCj4gCj4gICBkcml2ZXJz
L3dhdGNoZG9nL0tjb25maWcgICAgICAgfCAgIDggKysrCj4gICBkcml2ZXJzL3dhdGNoZG9nL01h
a2VmaWxlICAgICAgfCAgIDEgKwo+ICAgZHJpdmVycy93YXRjaGRvZy9hcm1fc21jX3dkdC5jIHwg
MTE2ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICAgMyBmaWxlcyBjaGFuZ2Vk
LCAxMjUgaW5zZXJ0aW9ucygrKQo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvd2F0Y2hk
b2cvYXJtX3NtY193ZHQuYwo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3dhdGNoZG9nL0tjb25m
aWcgYi9kcml2ZXJzL3dhdGNoZG9nL0tjb25maWcKPiBpbmRleCBiNWFjOGY3ZjUwZC4uM2EwMzQx
ZjYwOWQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy93YXRjaGRvZy9LY29uZmlnCj4gKysrIGIvZHJp
dmVycy93YXRjaGRvZy9LY29uZmlnCj4gQEAgLTM1Miw2ICszNTIsMTQgQEAgY29uZmlnIFdEVF9U
QU5HSUVSCj4gICAJICBJbnRlbCBUYW5naWVyIFNvQy4gSWYgeW91J3JlIHVzaW5nIGEgYm9hcmQg
d2l0aCBJbnRlbCBUYW5naWVyCj4gICAJICBTb0MsIHNheSBZIGhlcmUuCj4gICAKPiArY29uZmln
IFdEVF9BUk1fU01DCj4gKwlib29sICJBUk0gU01DIHdhdGNoZG9nIHRpbWVyIHN1cHBvcnQiCj4g
KwlkZXBlbmRzIG9uIFdEVCAmJiBBUk1fU01DQ0MKPiArCWltcGx5IFdBVENIRE9HCj4gKwloZWxw
Cj4gKwkgIFNlbGVjdCB0aGlzIHRvIGVuYWJsZSBBcm0gU01DIHdhdGNoZG9nIHRpbWVyLiBUaGlz
IHdhdGNoZG9nIHdpbGwgbWFuYWdlCj4gKwkgIGEgd2F0Y2hkb2cgYmFzZWQgb24gQVJNIFNNQ0ND
IGNvbW11bmljYXRpb24uCj4gKwo+ICAgY29uZmlnIFNQTF9XRFQKPiAgIAlib29sICJFbmFibGUg
ZHJpdmVyIG1vZGVsIGZvciB3YXRjaGRvZyB0aW1lciBkcml2ZXJzIGluIFNQTCIKPiAgIAlkZXBl
bmRzIG9uIFNQTF9ETQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3dhdGNoZG9nL01ha2VmaWxlIGIv
ZHJpdmVycy93YXRjaGRvZy9NYWtlZmlsZQo+IGluZGV4IDQ0NmQ5NjFkN2QyLi5hNDYzM2MwZDJm
YSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3dhdGNoZG9nL01ha2VmaWxlCj4gKysrIGIvZHJpdmVy
cy93YXRjaGRvZy9NYWtlZmlsZQo+IEBAIC0xOCw2ICsxOCw3IEBAIG9iai0kKENPTkZJR18kKFNQ
TF9UUExfKVdEVCkgKz0gd2R0LXVjbGFzcy5vCj4gICBvYmotJChDT05GSUdfV0RUX1NBTkRCT1gp
ICs9IHNhbmRib3hfd2R0Lm8KPiAgIG9iai0kKENPTkZJR19XRFRfQUxBUk1fU0FOREJPWCkgKz0g
c2FuZGJveF9hbGFybS13ZHQubwo+ICAgb2JqLSQoQ09ORklHX1dEVF9BUFBMRSkgKz0gYXBwbGVf
d2R0Lm8KPiArb2JqLSQoQ09ORklHX1dEVF9BUk1fU01DKSArPSBhcm1fc21jX3dkdC5vCj4gICBv
YmotJChDT05GSUdfV0RUX0FSTUFEQV8zN1hYKSArPSBhcm1hZGEtMzd4eC13ZHQubwo+ICAgb2Jq
LSQoQ09ORklHX1dEVF9BU1BFRUQpICs9IGFzdF93ZHQubwo+ICAgb2JqLSQoQ09ORklHX1dEVF9B
U1QyNjAwKSArPSBhc3QyNjAwX3dkdC5vCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvd2F0Y2hkb2cv
YXJtX3NtY193ZHQuYyBiL2RyaXZlcnMvd2F0Y2hkb2cvYXJtX3NtY193ZHQuYwo+IG5ldyBmaWxl
IG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAuLmUyZTNjNDU1MDgyCj4gLS0tIC9kZXYv
bnVsbAo+ICsrKyBiL2RyaXZlcnMvd2F0Y2hkb2cvYXJtX3NtY193ZHQuYwo+IEBAIC0wLDAgKzEs
MTE2IEBACj4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wKwo+ICsvKgo+ICsg
KiBBUk0gU2VjdXJlIE1vbml0b3IgQ2FsbCB3YXRjaGRvZyBkcml2ZXIKPiArICogQ29weXJpZ2h0
IChDKSAyMDIyLCBTVE1pY3JvZWxlY3Ryb25pY3MgLSBBbGwgUmlnaHRzIFJlc2VydmVkCj4gKyAq
Lwo+ICsKPiArI2luY2x1ZGUgPGRtLmg+Cj4gKyNpbmNsdWRlIDxkbS9kZXZpY2VfY29tcGF0Lmg+
Cj4gKyNpbmNsdWRlIDxkbS9vZl9hY2Nlc3MuaD4KPiArI2luY2x1ZGUgPGxpbnV4L2FybS1zbWNj
Yy5oPgo+ICsjaW5jbHVkZSA8bGludXgvcHNjaS5oPgo+ICsjaW5jbHVkZSA8d2R0Lmg+Cj4gKwo+
ICsjZGVmaW5lIERSVl9OQU1FCQkiYXJtX3NtY193ZHQiCj4gKyNkZWZpbmUgRFJWX1ZFUlNJT04J
CSIxLjAiCj4gKwo+ICsjZGVmaW5lIFdEVF9USU1FT1VUX1NFQ1MoVElNRU9VVCkJKChUSU1FT1VU
KSAvIDEwMDApCj4gKwo+ICtlbnVtIHNtY3dkX2NhbGwgewo+ICsJU01DV0RfSU5JVAkJPSAwLAo+
ICsJU01DV0RfU0VUX1RJTUVPVVQJPSAxLAo+ICsJU01DV0RfRU5BQkxFCQk9IDIsCj4gKwlTTUNX
RF9QRVQJCT0gMywKPiArCVNNQ1dEX0dFVF9USU1FTEVGVAk9IDQsCj4gK307Cj4gKwo+ICtzdHJ1
Y3Qgc21jd2RfcHJpdl9kYXRhIHsKPiArCXUzMiBzbWNfaWQ7Cj4gKwl1bnNpZ25lZCBpbnQgbWlu
X3RpbWVvdXQ7Cj4gKwl1bnNpZ25lZCBpbnQgbWF4X3RpbWVvdXQ7Cj4gK307Cj4gKwo+ICtzdGF0
aWMgaW50IHNtY3dkX2NhbGwoc3RydWN0IHVkZXZpY2UgKmRldiwgZW51bSBzbWN3ZF9jYWxsIGNh
bGwsCj4gKwkJICAgICAgdW5zaWduZWQgbG9uZyBhcmcsIHN0cnVjdCBhcm1fc21jY2NfcmVzICpy
ZXMpCj4gK3sKPiArCXN0cnVjdCBhcm1fc21jY2NfcmVzIGxvY2FsX3JlczsKPiArCXN0cnVjdCBz
bWN3ZF9wcml2X2RhdGEgKnByaXYgPSBkZXZfZ2V0X3ByaXYoZGV2KTsKPiArCj4gKwlpZiAoIXJl
cykKPiArCQlyZXMgPSAmbG9jYWxfcmVzOwo+ICsKPiArCWFybV9zbWNjY19zbWMocHJpdi0+c21j
X2lkLCBjYWxsLCBhcmcsIDAsIDAsIDAsIDAsIDAsIHJlcyk7Cj4gKwo+ICsJaWYgKHJlcy0+YTAg
PT0gUFNDSV9SRVRfTk9UX1NVUFBPUlRFRCkKPiArCQlyZXR1cm4gLUVOT0RFVjsKPiArCWlmIChy
ZXMtPmEwID09IFBTQ0lfUkVUX0lOVkFMSURfUEFSQU1TKQo+ICsJCXJldHVybiAtRUlOVkFMOwo+
ICsJaWYgKHJlcy0+YTAgIT0gUFNDSV9SRVRfU1VDQ0VTUykKPiArCQlyZXR1cm4gLUVJTzsKPiAr
Cj4gKwlyZXR1cm4gMDsKPiArfQo+ICsKPiArc3RhdGljIGludCBzbWN3ZF9yZXNldChzdHJ1Y3Qg
dWRldmljZSAqZGV2KQo+ICt7Cj4gKwlyZXR1cm4gc21jd2RfY2FsbChkZXYsIFNNQ1dEX1BFVCwg
MCwgTlVMTCk7Cj4gK30KPiArCj4gK3N0YXRpYyBpbnQgc21jd2Rfc3RvcChzdHJ1Y3QgdWRldmlj
ZSAqZGV2KQo+ICt7Cj4gKwlyZXR1cm4gc21jd2RfY2FsbChkZXYsIFNNQ1dEX0VOQUJMRSwgMCwg
TlVMTCk7Cj4gK30KPiArCj4gK3N0YXRpYyBpbnQgc21jd2Rfc3RhcnQoc3RydWN0IHVkZXZpY2Ug
KmRldiwgdTY0IHRpbWVvdXRfbXMsIHVsb25nIGZsYWdzKQo+ICt7Cj4gKwlpbnQgZXJyOwo+ICsJ
dTY0IHRpbWVvdXRfc2VjID0gV0RUX1RJTUVPVVRfU0VDUyh0aW1lb3V0X21zKTsKPiArCXN0cnVj
dCBzbWN3ZF9wcml2X2RhdGEgKnByaXYgPSBkZXZfZ2V0X3ByaXYoZGV2KTsKCk5pdHBpY2tpbmc6
IEl0J3MgZ2VuZXJhbGx5IG1vcmUgY29tbW9uIHRvIHVzZSB0aGUgcmV2ZXJzZSB4bWFzIHRyZWUK
c3R5bGUgZm9yIHZhcmlhYmxlIGRlY2xhcmF0aW9uIG9yZGVyaW5nLiBPbiBvdGhlciBwbGFjZXMg
aW4gdGhpcyBjb2RlCmFzIHdlbGwuCgo+ICsKPiArCWlmICh0aW1lb3V0X3NlYyA8IHByaXYtPm1p
bl90aW1lb3V0IHx8IHRpbWVvdXRfc2VjID4gcHJpdi0+bWF4X3RpbWVvdXQpCj4gKwkJcmV0dXJu
IC1FSU5WQUw7CgpBbiBlcnJvciBtZXNzYWdlIHdvdWxkIGJlIGdvb2QgaGVyZS4gT3IgYXQgbGVh
c3Qgc29tZSBkZWJ1ZyBsZXZlbAptZXNzYWdlLgoKPiArCj4gKwllcnIgPSBzbWN3ZF9jYWxsKGRl
diwgU01DV0RfU0VUX1RJTUVPVVQsIHRpbWVvdXRfc2VjLCBOVUxMKTsKPiArCWlmIChlcnIpCj4g
KwkJcmV0dXJuIGVycjsKCkFnYWluLCBwbGVhc2UgZW5oYW5jZSB0aGUgZHJpdmVyIHdpdGggc29t
ZSBlcnJvciBvciBhdCBsZWFzdCBkZWJ1ZwpsZXZlbCBsb2dnaW5nLgoKVGhhbmtzLApTdGVmYW4K
Cj4gKwo+ICsJcmV0dXJuIHNtY3dkX2NhbGwoZGV2LCBTTUNXRF9FTkFCTEUsIDEsIE5VTEwpOwo+
ICt9Cj4gKwo+ICtzdGF0aWMgaW50IHNtY3dkX3Byb2JlKHN0cnVjdCB1ZGV2aWNlICpkZXYpCj4g
K3sKPiArCWludCBlcnI7Cj4gKwlzdHJ1Y3QgYXJtX3NtY2NjX3JlcyByZXM7Cj4gKwlzdHJ1Y3Qg
c21jd2RfcHJpdl9kYXRhICpwcml2ID0gZGV2X2dldF9wcml2KGRldik7Cj4gKwo+ICsJcHJpdi0+
c21jX2lkID0gZGV2X3JlYWRfdTMyX2RlZmF1bHQoZGV2LCAiYXJtLHNtYy1pZCIsIDB4ODIwMDNE
MDYpOwo+ICsKPiArCWVyciA9IHNtY3dkX2NhbGwoZGV2LCBTTUNXRF9JTklULCAwLCAmcmVzKTsK
PiArCWlmIChlcnIgPCAwKQo+ICsJCXJldHVybiBlcnI7Cj4gKwo+ICsJcHJpdi0+bWluX3RpbWVv
dXQgPSByZXMuYTE7Cj4gKwlwcml2LT5tYXhfdGltZW91dCA9IHJlcy5hMjsKPiArCj4gKwlyZXR1
cm4gMDsKPiArfQo+ICsKPiArc3RhdGljIGNvbnN0IHN0cnVjdCB3ZHRfb3BzIHNtY3dkX29wcyA9
IHsKPiArCS5zdGFydAkJPSBzbWN3ZF9zdGFydCwKPiArCS5zdG9wCQk9IHNtY3dkX3N0b3AsCj4g
KwkucmVzZXQJCT0gc21jd2RfcmVzZXQsCj4gK307Cj4gKwo+ICtzdGF0aWMgY29uc3Qgc3RydWN0
IHVkZXZpY2VfaWQgc21jd2RfZHRfaWRzW10gPSB7Cj4gKwl7IC5jb21wYXRpYmxlID0gImFybSxz
bWMtd2R0IiB9LAo+ICsJe30KPiArfTsKPiArCj4gK1VfQk9PVF9EUklWRVIod2R0X3NhbmRib3gp
ID0gewo+ICsJLm5hbWUgPSAic21jd2QiLAo+ICsJLmlkID0gVUNMQVNTX1dEVCwKPiArCS5vZl9t
YXRjaCA9IHNtY3dkX2R0X2lkcywKPiArCS5wcml2X2F1dG8gPSBzaXplb2Yoc3RydWN0IHNtY3dk
X3ByaXZfZGF0YSksCj4gKwkucHJvYmUgPSBzbWN3ZF9wcm9iZSwKPiArCS5vcHMgPSAmc21jd2Rf
b3BzLAo+ICt9OwoKVmllbGUgR3LDvMOfZSwKU3RlZmFuIFJvZXNlCgotLSAKREVOWCBTb2Z0d2Fy
ZSBFbmdpbmVlcmluZyBHbWJILCAgICAgIE1hbmFnaW5nIERpcmVjdG9yOiBFcmlrYSBVbnRlcgpI
UkIgMTY1MjM1IE11bmljaCwgT2ZmaWNlOiBLaXJjaGVuc3RyLjUsIEQtODIxOTQgR3JvZWJlbnpl
bGwsIEdlcm1hbnkKUGhvbmU6ICgrNDkpLTgxNDItNjY5ODktNTEgRmF4OiAoKzQ5KS04MTQyLTY2
OTg5LTgwIEVtYWlsOiBzckBkZW54LmRlCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClVib290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==
