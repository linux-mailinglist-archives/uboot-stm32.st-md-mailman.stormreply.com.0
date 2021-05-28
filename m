Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3EB39561B
	for <lists+uboot-stm32@lfdr.de>; Mon, 31 May 2021 09:30:42 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E1C9BC57B6B;
	Mon, 31 May 2021 07:30:41 +0000 (UTC)
Received: from mx01.ayax.eu (mx01.ayax.eu [188.137.98.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E90A2C32E8F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 May 2021 16:53:22 +0000 (UTC)
Received: from [192.168.192.146] (port=39194 helo=nx64de-df6d00)
 by mx01.ayax.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <gszymaszek@short.pl>)
 id 1lmfjc-0008Ao-OD; Fri, 28 May 2021 18:53:20 +0200
Date: Fri, 28 May 2021 18:53:19 +0200
From: Grzegorz Szymaszek <gszymaszek@short.pl>
To: u-boot@lists.denx.de
Message-ID: <8135659df2b668782d04ee8dc5f352a04e92f1c0.1622220270.git.gszymaszek@short.pl>
Mail-Followup-To: u-boot@lists.denx.de,
 Marcin Sloniewski <marcin.sloniewski@gmail.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com
References: <cover.1622220270.git.gszymaszek@short.pl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1622220270.git.gszymaszek@short.pl>
X-Mailman-Approved-At: Mon, 31 May 2021 07:30:40 +0000
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Marcin Sloniewski <marcin.sloniewski@gmail.com>
Subject: [Uboot-stm32] [PATCH 1/5] arm: dts: stm32mp157c-odyssey-som: fix
 the basic SDMMC2 properties
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

VGhlIFNETU1DMiBpbnRlcmZhY2UgaG9zdHMgYW4gZU1NQy4gUmVwbGFjZSB0aGUgaW50ZXJmYWNl
IHByb3BlcnRpZXMKdGhhdCB3b3VsZCBvbmx5IGFwcGx5IHRvIFNEIGNhcmRz4oCU4oCcYnJva2Vu
LWNk4oCdIGFuZCDigJxkaXNhYmxlLXdw4oCd4oCUd2l0aApyZWxldmFudCBvbmVzOiDigJxub24t
cmVtb3ZhYmxl4oCdLCDigJxuby1zZOKAnSBhbmQg4oCcbm8tc2Rpb+KAnS4KClNpZ25lZC1vZmYt
Ynk6IEdyemVnb3J6IFN6eW1hc3playA8Z3N6eW1hc3pla0BzaG9ydC5wbD4KQ2M6IFBhdHJpY2Ug
Q2hvdGFyZCA8cGF0cmljZS5jaG90YXJkQGZvc3Muc3QuY29tPgpDYzogUGF0cmljayBEZWxhdW5h
eSA8cGF0cmljay5kZWxhdW5heUBmb3NzLnN0LmNvbT4KLS0tCiBhcmNoL2FybS9kdHMvc3RtMzJt
cDE1N2Mtb2R5c3NleS1zb20uZHRzaSB8IDUgKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vZHRzL3N0bTMy
bXAxNTdjLW9keXNzZXktc29tLmR0c2kgYi9hcmNoL2FybS9kdHMvc3RtMzJtcDE1N2Mtb2R5c3Nl
eS1zb20uZHRzaQppbmRleCA4M2ZmMmU3Y2UxLi41Yzc1OGIwZjcyIDEwMDY0NAotLS0gYS9hcmNo
L2FybS9kdHMvc3RtMzJtcDE1N2Mtb2R5c3NleS1zb20uZHRzaQorKysgYi9hcmNoL2FybS9kdHMv
c3RtMzJtcDE1N2Mtb2R5c3NleS1zb20uZHRzaQpAQCAtMjYzLDggKzI2Myw5IEBACiAJcGluY3Ry
bC0wID0gPCZzZG1tYzJfYjRfcGluc19hPjsKIAlwaW5jdHJsLTEgPSA8JnNkbW1jMl9iNF9vZF9w
aW5zX2E+OwogCXBpbmN0cmwtMiA9IDwmc2RtbWMyX2I0X3NsZWVwX3BpbnNfYT47Ci0JYnJva2Vu
LWNkOwotCWRpc2FibGUtd3A7CisJbm9uLXJlbW92YWJsZTsKKwluby1zZDsKKwluby1zZGlvOwog
CXN0LG5lZy1lZGdlOwogCWJ1cy13aWR0aCA9IDw0PjsKIAl2bW1jLXN1cHBseSA9IDwmdjN2Mz47
Ci0tIAoyLjMwLjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClVib290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFu
L2xpc3RpbmZvL3Vib290LXN0bTMyCg==
