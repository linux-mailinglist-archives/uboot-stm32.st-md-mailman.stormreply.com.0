Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AEECA8432D
	for <lists+uboot-stm32@lfdr.de>; Thu, 10 Apr 2025 14:33:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AB271C7803C;
	Thu, 10 Apr 2025 12:33:20 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B6634C69063
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Apr 2025 17:05:51 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DBF901BCB;
 Mon,  7 Apr 2025 10:05:51 -0700 (PDT)
Received: from localhost.localdomain (unknown [10.57.17.131])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 19D673F59E;
 Mon,  7 Apr 2025 10:05:48 -0700 (PDT)
From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>
To: u-boot@lists.denx.de
Date: Mon,  7 Apr 2025 19:05:26 +0200
Message-ID: <20250407170529.893307-3-vincent.stehle@arm.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250407170529.893307-1-vincent.stehle@arm.com>
References: <20250407170529.893307-1-vincent.stehle@arm.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 10 Apr 2025 12:33:19 +0000
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>,
 Masahisa Kojima <kojima.masahisa@socionext.com>,
 Jassi Brar <jaswinder.singh@linaro.org>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Michal Simek <michal.simek@amd.com>
Subject: [Uboot-stm32] [PATCH 2/5] board: st: common: fix dfu alt buffer
	clearing
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

VGhlIHNldF9kZnVfYWx0X2luZm8oKSBmdW5jdGlvbiBjYWxscyB0aGUgQUxMT0NfQ0FDSEVfQUxJ
R05fQlVGRkVSKCkKbWFjcm8gdG8gZGVjbGFyZSBhIGBidWYnIHZhcmlhYmxlIHBvaW50ZXIgaW50
byBhbiBhcnJheSBhbGxvY2F0ZWQgb24gdGhlCnN0YWNrLiBJdCB0aGVuIGNhbGxzIHRoZSBtZW1z
ZXQoKSBmdW5jdGlvbiB0byBjbGVhciB0aGUgdXNlYWJsZSBwb3J0aW9uCm9mIHRoZSBhcnJheSB1
c2luZyB0aGUgaWRpb21hdGljIGV4cHJlc3Npb24gYHNpemVvZihidWYpJy4KCldoaWxlIHRoaXMg
d291bGQgaW5kZWVkIHdvcmsgZmluZSBmb3IgYW4gYXJyYXksIGluIHRoZSBwcmVzZW50IGNhc2Ug
d2UKZW5kIHVwIGNsZWFyaW5nIG9ubHkgdGhlIHNpemUgb2YgYSBwb2ludGVyLgpGaXggdGhpcyBi
eSBzcGVjaWZ5aW5nIHRoZSBleHBsaWNpdCBzaXplIGBERlVfQUxUX0JVRl9MRU4nIGluc3RlYWQu
CgpGaXhlczogZWMyOTMzZTU0M2RmICgiYm9hcmQ6IHN0bTMybXAxOiBtb3ZlIHNldF9kZnVfYWx0
X2luZm8gaW4gc3QgY29tbW9uIGRpcmVjdG9yeSIpClNpZ25lZC1vZmYtYnk6IFZpbmNlbnQgU3Rl
aGzDqSA8dmluY2VudC5zdGVobGVAYXJtLmNvbT4KQ2M6IFBhdHJpY2sgRGVsYXVuYXkgPHBhdHJp
Y2suZGVsYXVuYXlAZm9zcy5zdC5jb20+CkNjOiBQYXRyaWNlIENob3RhcmQgPHBhdHJpY2UuY2hv
dGFyZEBmb3NzLnN0LmNvbT4KQ2M6IFRvbSBSaW5pIDx0cmluaUBrb25zdWxrby5jb20+CkNjOiBN
YXJlayBWYXN1dCA8bWFyZXhAZGVueC5kZT4KLS0tCiBib2FyZC9zdC9jb21tb24vc3RtMzJtcF9k
ZnUuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQoKZGlmZiAtLWdpdCBhL2JvYXJkL3N0L2NvbW1vbi9zdG0zMm1wX2RmdS5jIGIvYm9hcmQvc3Qv
Y29tbW9uL3N0bTMybXBfZGZ1LmMKaW5kZXggMWRiOGU0NTQ4MGUuLjhjMWY4MGI2NzhhIDEwMDY0
NAotLS0gYS9ib2FyZC9zdC9jb21tb24vc3RtMzJtcF9kZnUuYworKysgYi9ib2FyZC9zdC9jb21t
b24vc3RtMzJtcF9kZnUuYwpAQCAtMTA1LDcgKzEwNSw3IEBAIHZvaWQgc2V0X2RmdV9hbHRfaW5m
byhjaGFyICppbnRlcmZhY2UsIGNoYXIgKmRldnN0cikKIAlpZiAoZW52X2dldCgiZGZ1X2FsdF9p
bmZvIikpCiAJCXJldHVybjsKIAotCW1lbXNldChidWYsIDAsIHNpemVvZihidWYpKTsKKwltZW1z
ZXQoYnVmLCAwLCBERlVfQUxUX0JVRl9MRU4pOwogCiAJc25wcmludGYoYnVmLCBERlVfQUxUX0JV
Rl9MRU4sCiAJCSAicmFtIDA9JXMiLCBDT05GSUdfREZVX0FMVF9SQU0wKTsKLS0gCjIuNDcuMgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3Rt
MzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20K
aHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJv
b3Qtc3RtMzIK
