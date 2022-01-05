Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1585E484F7E
	for <lists+uboot-stm32@lfdr.de>; Wed,  5 Jan 2022 09:44:35 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D4923C5F1F6;
	Wed,  5 Jan 2022 08:44:34 +0000 (UTC)
Received: from mout-u-107.mailbox.org (mout-u-107.mailbox.org [91.198.250.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2B5E5C5F1F5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Jan 2022 08:44:34 +0000 (UTC)
Received: from smtp2.mailbox.org (unknown [91.198.250.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-u-107.mailbox.org (Postfix) with ESMTPS id 4JTNMP6WX6zQlJP;
 Wed,  5 Jan 2022 09:44:33 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Message-ID: <5a8697e7-e2cc-7988-9496-06a051fe0ef6@denx.de>
Date: Wed, 5 Jan 2022 09:44:30 +0100
MIME-Version: 1.0
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de
References: <20220104132401.3573475-1-patrick.delaunay@foss.st.com>
 <20220104142328.v1.5.I5fc8065d06afb12c358588f9078ba15b1cbbe94c@changeid>
From: Stefan Roese <sr@denx.de>
In-Reply-To: <20220104142328.v1.5.I5fc8065d06afb12c358588f9078ba15b1cbbe94c@changeid>
Cc: Marek Vasut <marex@denx.de>, Priyanka Jain <priyanka.jain@nxp.com>,
 Simon Glass <sjg@chromium.org>,
 =?UTF-8?Q?Marek_Beh=c3=ban?= <marek.behun@nic.cz>,
 egnite GmbH <info@egnite.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Eugen Hristev <eugen.hristev@microchip.com>
Subject: Re: [Uboot-stm32] [PATCH v1 5/5] Convert CONFIG_AT91_EFLASH to
	Kconfig
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

T24gMS80LzIyIDE0OjI0LCBQYXRyaWNrIERlbGF1bmF5IHdyb3RlOgo+IFRoaXMgY29udmVydHMg
dGhlIGZvbGxvd2luZyB0byBLY29uZmlnOgo+ICAgICBDT05GSUdfQVQ5MV9FRkxBU0gKPiAKPiBT
aWduZWQtb2ZmLWJ5OiBQYXRyaWNrIERlbGF1bmF5IDxwYXRyaWNrLmRlbGF1bmF5QGZvc3Muc3Qu
Y29tPgo+IFJldmlld2VkLWJ5OiBTaW1vbiBHbGFzcyA8c2pnQGNocm9taXVtLm9yZz4KClJldmll
d2VkLWJ5OiBTdGVmYW4gUm9lc2UgPHNyQGRlbnguZGU+CgpUaGFua3MsClN0ZWZhbgoKPiAtLS0K
PiAKPiAgIGFyY2gvYXJtL21hY2gtYXQ5MS9LY29uZmlnICAgfCA4ICsrKysrKysrCj4gICBjb25m
aWdzL2V0aGVybnV0NV9kZWZjb25maWcgIHwgMiArLQo+ICAgaW5jbHVkZS9jb25maWdzL2V0aGVy
bnV0NS5oICB8IDEgLQo+ICAgc2NyaXB0cy9jb25maWdfd2hpdGVsaXN0LnR4dCB8IDEgLQo+ICAg
NCBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gCj4gZGlm
ZiAtLWdpdCBhL2FyY2gvYXJtL21hY2gtYXQ5MS9LY29uZmlnIGIvYXJjaC9hcm0vbWFjaC1hdDkx
L0tjb25maWcKPiBpbmRleCA0NDQ4Y2ExNTkyLi4wMGYzMTA0NWQ2IDEwMDY0NAo+IC0tLSBhL2Fy
Y2gvYXJtL21hY2gtYXQ5MS9LY29uZmlnCj4gKysrIGIvYXJjaC9hcm0vbWFjaC1hdDkxL0tjb25m
aWcKPiBAQCAtMzAyLDYgKzMwMiwxNCBAQCBjb25maWcgQVRNRUxfU0ZSCj4gICBjb25maWcgU1lT
X1NPQwo+ICAgCWRlZmF1bHQgImF0OTEiCj4gICAKPiArY29uZmlnIEFUOTFfRUZMQVNICj4gKwli
b29sICJTdXBwb3J0IEFUOTEgZmxhc2ggZHJpdmVyIgo+ICsJZGVwZW5kcyBvbiBBVDkxU0FNOVhF
Cj4gKwlzZWxlY3QgVVNFX1NZU19NQVhfRkxBU0hfQkFOS1MKPiArCWhlbHAKPiArCSAgRW5hYmxl
IHRoZSBkcml2ZXIgZm9yIHRoZSBlbWJlZGRlZCBmbGFzaCB1c2VkIGluIHRoZSBBdG1lbAo+ICsJ
ICBBVDkxU0FNOVhFIGRldmljZXMuCj4gKwo+ICAgc291cmNlICJib2FyZC9hdG1lbC9hdDkxc2Ft
OTI2MGVrL0tjb25maWciCj4gICBzb3VyY2UgImJvYXJkL2F0bWVsL2F0OTFzYW05MjYxZWsvS2Nv
bmZpZyIKPiAgIHNvdXJjZSAiYm9hcmQvYXRtZWwvYXQ5MXNhbTkyNjNlay9LY29uZmlnIgo+IGRp
ZmYgLS1naXQgYS9jb25maWdzL2V0aGVybnV0NV9kZWZjb25maWcgYi9jb25maWdzL2V0aGVybnV0
NV9kZWZjb25maWcKPiBpbmRleCA1ZDk4MzE4YWFiLi43YTcwMWRiMGUxIDEwMDY0NAo+IC0tLSBh
L2NvbmZpZ3MvZXRoZXJudXQ1X2RlZmNvbmZpZwo+ICsrKyBiL2NvbmZpZ3MvZXRoZXJudXQ1X2Rl
ZmNvbmZpZwo+IEBAIC00LDYgKzQsNyBAQCBDT05GSUdfQVJDSF9DUFVfSU5JVD15Cj4gICBDT05G
SUdfQVJDSF9BVDkxPXkKPiAgIENPTkZJR19TWVNfVEVYVF9CQVNFPTB4MjcwMDAwMDAKPiAgIENP
TkZJR19TWVNfTUFMTE9DX0xFTj0weDEyMTAwMAo+ICtDT05GSUdfQVQ5MV9FRkxBU0g9eQo+ICAg
Q09ORklHX1NZU19NQUxMT0NfRl9MRU49MHgyMDAwCj4gICBDT05GSUdfVEFSR0VUX0VUSEVSTlVU
NT15Cj4gICBDT05GSUdfTlJfRFJBTV9CQU5LUz0xCj4gQEAgLTY2LDcgKzY3LDYgQEAgQ09ORklH
X1NZU19JMkNfU09GVF9TTEFWRT0wCj4gICBDT05GSUdfR0VORVJJQ19BVE1FTF9NQ0k9eQo+ICAg
Q09ORklHX01URD15Cj4gICBDT05GSUdfTVREX05PUl9GTEFTSD15Cj4gLUNPTkZJR19VU0VfU1lT
X01BWF9GTEFTSF9CQU5LUz15Cj4gICBDT05GSUdfTVREX1JBV19OQU5EPXkKPiAgICMgQ09ORklH
X1NZU19OQU5EX1VTRV9GTEFTSF9CQlQgaXMgbm90IHNldAo+ICAgQ09ORklHX05BTkRfQVRNRUw9
eQo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2NvbmZpZ3MvZXRoZXJudXQ1LmggYi9pbmNsdWRlL2Nv
bmZpZ3MvZXRoZXJudXQ1LmgKPiBpbmRleCBkNzJmNzA0NjM2Li5kODhjMTRhYzQ0IDEwMDY0NAo+
IC0tLSBhL2luY2x1ZGUvY29uZmlncy9ldGhlcm51dDUuaAo+ICsrKyBiL2luY2x1ZGUvY29uZmln
cy9ldGhlcm51dDUuaAo+IEBAIC0zMyw3ICszMyw2IEBACj4gICAKPiAgIC8qIDUxMmtCIG9uLWNo
aXAgTk9SIGZsYXNoICovCj4gICAjIGRlZmluZSBDT05GSUdfU1lTX0ZMQVNIX0JBU0UJCTB4MDAy
MDAwMDAgLyogQVQ5MVNBTTlYRV9GTEFTSF9CQVNFICovCj4gLSMgZGVmaW5lIENPTkZJR19BVDkx
X0VGTEFTSAo+ICAgIyBkZWZpbmUgQ09ORklHX1NZU19NQVhfRkxBU0hfU0VDVAkzMgo+ICAgIyBk
ZWZpbmUgQ09ORklHX0VGTEFTSF9QUk9UU0VDVE9SUwkxCj4gICAKPiBkaWZmIC0tZ2l0IGEvc2Ny
aXB0cy9jb25maWdfd2hpdGVsaXN0LnR4dCBiL3NjcmlwdHMvY29uZmlnX3doaXRlbGlzdC50eHQK
PiBpbmRleCA3NzI2MjQzZjIyLi4zYTkyM2FiZjdlIDEwMDY0NAo+IC0tLSBhL3NjcmlwdHMvY29u
ZmlnX3doaXRlbGlzdC50eHQKPiArKysgYi9zY3JpcHRzL2NvbmZpZ193aGl0ZWxpc3QudHh0Cj4g
QEAgLTE4LDcgKzE4LDYgQEAgQ09ORklHX0FUOTFTQU05RzIwRUsKPiAgIENPTkZJR19BVDkxU0FN
OUcyMEVLXzJNTUMKPiAgIENPTkZJR19BVDkxU0FNOUc0NV9MQ0RfQkFTRQo+ICAgQ09ORklHX0FU
OTFTQU05TTEwRzQ1RUsKPiAtQ09ORklHX0FUOTFfRUZMQVNICj4gICBDT05GSUdfQVQ5MV9HUElP
X1BVTExVUAo+ICAgQ09ORklHX0FUOTFfTEVECj4gICBDT05GSUdfQVQ5MV9XQU5UU19DT01NT05f
UEhZCj4gCgpWaWVsZSBHcsO8w59lLApTdGVmYW4gUm9lc2UKCi0tIApERU5YIFNvZnR3YXJlIEVu
Z2luZWVyaW5nIEdtYkgsICAgICAgTWFuYWdpbmcgRGlyZWN0b3I6IFdvbGZnYW5nIERlbmsKSFJC
IDE2NTIzNSBNdW5pY2gsIE9mZmljZTogS2lyY2hlbnN0ci41LCBELTgyMTk0IEdyb2ViZW56ZWxs
LCBHZXJtYW55ClBob25lOiAoKzQ5KS04MTQyLTY2OTg5LTUxIEZheDogKCs0OSktODE0Mi02Njk4
OS04MCBFbWFpbDogc3JAZGVueC5kZQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
