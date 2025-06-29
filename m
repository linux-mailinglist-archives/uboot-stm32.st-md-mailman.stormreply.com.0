Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DD123AECFD2
	for <lists+uboot-stm32@lfdr.de>; Sun, 29 Jun 2025 21:10:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6B2C2C36B31;
	Sun, 29 Jun 2025 19:10:58 +0000 (UTC)
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1A6BDC36B29
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 29 Jun 2025 19:10:56 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4bVf5V5z2rz9sb9;
 Sun, 29 Jun 2025 21:10:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1751224254;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gLNQ8fxnonJpK20WMywOsA1Fps/EuDuuF5nqBkoLB+w=;
 b=mSeU9+IOxpvFAKB9TFk16idov8BfaHvzn40YyGlh1XT5Ge8BZhI1ZjH93rxNMRrWFQZlip
 W1C07CQBSNzZzvwT6WbJ+SHvUsT02JKRSDpQ6dP9ELTW5BagGyXYhg4ohD3b+IYgkNiY33
 SdiWeTqr3QQRpJINcQalQ/8UQqo0nCltQppzkUIC96I2mab/LzGfITuy/3Q4deOp3PuWWG
 b6eWerLHrSGSKCiRkV6ULmnMB8SDMnrd18BUbM357ScfP2+72RWHvM/4q+6NRrVNZ8Um1j
 23miKIOevHdFNBkql7NpUHxghX6zBYny4UxPs4Dl+JKg/iu/ATudyKRjm4UQ5Q==
Message-ID: <0c1ec8bd-7492-4315-bf14-7184a04bd96e@mailbox.org>
Date: Sun, 29 Jun 2025 21:10:52 +0200
MIME-Version: 1.0
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de
References: <20250512172149.150214-1-marek.vasut@mailbox.org>
 <20250512172149.150214-4-marek.vasut@mailbox.org>
 <2e65615b-6b87-4bc8-b349-d7ce585bc23c@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <2e65615b-6b87-4bc8-b349-d7ce585bc23c@foss.st.com>
X-MBO-RS-ID: 64aa87aeca50d686f51
X-MBO-RS-META: nae66prbi64nhxp9f5swcbb5rpieix9o
Cc: Tom Rini <trini@konsulko.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>, u-boot@dh-electronics.com,
 Cheick Traore <cheick.traore@foss.st.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Sughosh Ganu <sughosh.ganu@linaro.org>,
 uboot-stm32@st-md-mailman.stormreply.com, Simon Glass <sjg@chromium.org>,
 Lionel Debieve <lionel.debieve@foss.st.com>,
 Pascal Zimmermann <pzimmermann@dh-electronics.com>
Subject: Re: [Uboot-stm32] [PATCH 03/10] ARM: stm32: Limit early cache
 enablement in SPL to STM32MP15xx
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

T24gNi8zLzI1IDM6MzcgUE0sIFBhdHJpY2sgREVMQVVOQVkgd3JvdGU6CgpIaSwKCj4+IGRpZmYg
LS1naXQgYS9hcmNoL2FybS9tYWNoLXN0bTMybXAvc3RtMzJtcDEvY3B1LmMgYi9hcmNoL2FybS9t
YWNoLSAKPj4gc3RtMzJtcC9zdG0zMm1wMS9jcHUuYwo+PiBpbmRleCA5YWI1YTNlZGU1Mi4uMWFl
ODI0ODlhNGIgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvYXJtL21hY2gtc3RtMzJtcC9zdG0zMm1wMS9j
cHUuYwo+PiArKysgYi9hcmNoL2FybS9tYWNoLXN0bTMybXAvc3RtMzJtcDEvY3B1LmMKPj4gQEAg
LTI4LDcgKzI4LDkgQEAKPj4gwqDCoCAqIGVhcmx5IFRMQiBpbnRvIHRoZSAuZGF0YSBzZWN0aW9u
IHNvIHRoYXQgaXQgbm90IGdldCBjbGVhcmVkCj4+IMKgwqAgKiB3aXRoIDE2a0IgYWxsaWdubWVu
dCAoc2VlIFRUQlIwX0JBU0VfQUREUl9NQVNLKQo+PiDCoMKgICovCj4+ICsjaWYgKCFJU19FTkFC
TEVEKENPTkZJR19YUExfQlVJTEQpIHx8ICFJU19FTkFCTEVEKENPTkZJR19TVE0zMk1QMTNYKSkK
Pj4gwqAgdTggZWFybHlfdGxiW1BHVEFCTEVfU0laRV0gX19zZWN0aW9uKCIuZGF0YSIpIF9fYWxp
Z25lZCgweDQwMDApOwo+PiArI2VuZGlmCj4+IMKgIHUzMiBnZXRfYm9vdG1vZGUodm9pZCkKPj4g
wqAgewo+PiBAQCAtOTUsMTggKzk3LDE5IEBAIHZvaWQgZHJhbV9iYW5rX21tdV9zZXR1cChpbnQg
YmFuaykKPj4gwqDCoCAqLwo+PiDCoCBzdGF0aWMgdm9pZCBlYXJseV9lbmFibGVfY2FjaGVzKHZv
aWQpCj4+IMKgIHsKPj4gKyNpZiAoIUlTX0VOQUJMRUQoQ09ORklHX1hQTF9CVUlMRCkgfHwgIUlT
X0VOQUJMRUQoQ09ORklHX1NUTTMyTVAxM1gpKQo+IAo+IAo+IGNhbiB5b3UgcmVwbGFjZSAjaWYs
IGlmIGl0IHBvc3NpYmxlPwo+IAo+IAo+IGlmICghSVNfRU5BQkxFRChDT05GSUdfWFBMX0JVSUxE
KSB8fCAhSVNfRU5BQkxFRChDT05GSUdfU1RNMzJNUDEzWCkpCj4gCj4gIMKgwqDCoMKgcmV0dXJu
OwpObywgYmVjYXVzZSBvZiB0aGUgInU4IGVhcmx5X3RsYltQR1RBQkxFX1NJWkVdIF9fc2VjdGlv
bigiLmRhdGEiKSAKX19hbGlnbmVkKDB4NDAwMCk7IiBkZXBlbmRlbmN5IHdoaWNoIHJlYWxseSBt
dXN0IGJlIGNvbXBpbGVkIG91dCB1c2luZyAKI2lmIC4uLiAjZW5kaWYuIElmIHRoZSBlYXJseV90
bGIgaXMgdW5yZWFjaGFibGUgZHVlIHRvIHByZXByb2Nlc3NvciAKbWFjcm9zLCB0aGVuIGVhcmx5
X2VuYWJsZV9jYWNoZXMoKSBjYW5ub3QgcmVmZXJlbmNlIGl0LCBoZW5jZSB0aGUgI2lmIAouLi4g
aW4gaXQuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClVi
b290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL3Vib290LXN0bTMyCg==
