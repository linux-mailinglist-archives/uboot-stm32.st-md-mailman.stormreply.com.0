Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E25BB365384
	for <lists+uboot-stm32@lfdr.de>; Tue, 20 Apr 2021 09:48:54 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7FFFEC57195;
	Tue, 20 Apr 2021 07:48:54 +0000 (UTC)
Received: from mx01.ayax.eu (mx01.ayax.eu [188.137.98.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B8FA1C3FADC
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Apr 2021 17:56:11 +0000 (UTC)
Received: from [192.168.192.146] (port=58416 helo=nx64de-df6d00)
 by mx01.ayax.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <gszymaszek@short.pl>)
 id 1lYY7l-0003aS-Ia; Mon, 19 Apr 2021 19:55:53 +0200
Date: Mon, 19 Apr 2021 19:55:52 +0200
From: Grzegorz Szymaszek <gszymaszek@short.pl>
Message-ID: <YH3EKEuGy1topHtJ@nx64de-df6d00>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailman-Approved-At: Tue, 20 Apr 2021 07:48:52 +0000
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 Marcin Sloniewski <marcin.sloniewski@gmail.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH] arm: dts: stm32mp157c-odyssey-som: enable the
	RNG1
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

RW5hYmxlIHRoZSB0cnVlIHJhbmRvbSBudW1iZXIgZ2VuZXJhdG9yLiBJdCBjYW4gYmUgdXNlZCwg
Zm9yIGV4YW1wbGUsIHRvCmdlbmVyYXRlIHBhcnRpdGlvbiBVVUlEcyB3aGVuIHBhcnRpdGlvbmlu
ZyB3aXRoIHRoZSBncHQgY29tbWFuZC4gVGhlCmdlbmVyYXRvciBpcyBhbHJlYWR5IGVuYWJsZWQg
aW4gdGhlIGRldmljZSB0cmVlcyBvZiBzZXZlcmFsIG90aGVyClNUTTMyTVAx4oCQYmFzZWQgYm9h
cmRzLCBsaWtlIERLeCBvciBESENPTS4KClNpZ25lZC1vZmYtYnk6IEdyemVnb3J6IFN6eW1hc3pl
ayA8Z3N6eW1hc3pla0BzaG9ydC5wbD4KQ2M6IFBhdHJpY2UgQ2hvdGFyZCA8cGF0cmljZS5jaG90
YXJkQGZvc3Muc3QuY29tPgpDYzogUGF0cmljayBEZWxhdW5heSA8cGF0cmljay5kZWxhdW5heUBm
b3NzLnN0LmNvbT4KLS0tCiBhcmNoL2FybS9kdHMvc3RtMzJtcDE1N2Mtb2R5c3NleS1zb20uZHRz
aSB8IDQgKysrKwogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBh
L2FyY2gvYXJtL2R0cy9zdG0zMm1wMTU3Yy1vZHlzc2V5LXNvbS5kdHNpIGIvYXJjaC9hcm0vZHRz
L3N0bTMybXAxNTdjLW9keXNzZXktc29tLmR0c2kKaW5kZXggODNmZjJlN2NlMS4uZTM2N2EzMTFj
NCAxMDA2NDQKLS0tIGEvYXJjaC9hcm0vZHRzL3N0bTMybXAxNTdjLW9keXNzZXktc29tLmR0c2kK
KysrIGIvYXJjaC9hcm0vZHRzL3N0bTMybXAxNTdjLW9keXNzZXktc29tLmR0c2kKQEAgLTI1OCw2
ICsyNTgsMTAgQEAKIAlzdGF0dXMgPSAib2theSI7CiB9OwogCismcm5nMSB7CisJc3RhdHVzID0g
Im9rYXkiOworfTsKKwogJnNkbW1jMiB7CiAJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IiwgIm9w
ZW5kcmFpbiIsICJzbGVlcCI7CiAJcGluY3RybC0wID0gPCZzZG1tYzJfYjRfcGluc19hPjsKLS0g
CjIuMzAuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
VWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlz
dGluZm8vdWJvb3Qtc3RtMzIK
