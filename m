Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D916399B41
	for <lists+uboot-stm32@lfdr.de>; Thu,  3 Jun 2021 09:08:08 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0BD91C57B69;
	Thu,  3 Jun 2021 07:08:08 +0000 (UTC)
Received: from mx01.ayax.eu (mx01.ayax.eu [188.137.98.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0E4E2C36B25
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  2 Jun 2021 17:08:28 +0000 (UTC)
Received: from [192.168.192.146] (port=55130 helo=nx64de-df6d00)
 by mx01.ayax.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <gszymaszek@short.pl>)
 id 1loULw-0000Wi-VI; Wed, 02 Jun 2021 19:08:25 +0200
Date: Wed, 2 Jun 2021 19:08:23 +0200
From: Grzegorz Szymaszek <gszymaszek@short.pl>
To: u-boot@lists.denx.de
Message-ID: <f69f91b059ce1d44de15994ac7a6fc25e4165448.1622651232.git.gszymaszek@short.pl>
Mail-Followup-To: u-boot@lists.denx.de,
 Marcin Sloniewski <marcin.sloniewski@gmail.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com
References: <cover.1622651232.git.gszymaszek@short.pl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1622651232.git.gszymaszek@short.pl>
X-Mailman-Approved-At: Thu, 03 Jun 2021 07:08:06 +0000
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Marcin Sloniewski <marcin.sloniewski@gmail.com>
Subject: [Uboot-stm32] [PATCH v2 1/5] arm: dts: stm32mp157c-odyssey-som: fix
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
eSA8cGF0cmljay5kZWxhdW5heUBmb3NzLnN0LmNvbT4KUmV2aWV3ZWQtYnk6IFBhdHJpY2UgQ2hv
dGFyZCA8cGF0cmljZS5jaG90YXJkQGZvc3Muc3QuY29tPgotLS0KQ2hhbmdlcyBmb3IgdjI6CiAg
IC0gcmViYXNlZCBvbiBjdXJyZW50IG1hc3RlciAocGF0Y2ggbm90IGNoYW5nZWQpCiAgIC0gYWRk
ZWQgUGF0cmljZSBDaG90YXJk4oCZcyBSZXZpZXdlZC1ieQoKIGFyY2gvYXJtL2R0cy9zdG0zMm1w
MTU3Yy1vZHlzc2V5LXNvbS5kdHNpIHwgNSArKystLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL2FybS9kdHMvc3RtMzJt
cDE1N2Mtb2R5c3NleS1zb20uZHRzaSBiL2FyY2gvYXJtL2R0cy9zdG0zMm1wMTU3Yy1vZHlzc2V5
LXNvbS5kdHNpCmluZGV4IGUzNjdhMzExYzQuLmVkMzk5YzAwZDEgMTAwNjQ0Ci0tLSBhL2FyY2gv
YXJtL2R0cy9zdG0zMm1wMTU3Yy1vZHlzc2V5LXNvbS5kdHNpCisrKyBiL2FyY2gvYXJtL2R0cy9z
dG0zMm1wMTU3Yy1vZHlzc2V5LXNvbS5kdHNpCkBAIC0yNjcsOCArMjY3LDkgQEAKIAlwaW5jdHJs
LTAgPSA8JnNkbW1jMl9iNF9waW5zX2E+OwogCXBpbmN0cmwtMSA9IDwmc2RtbWMyX2I0X29kX3Bp
bnNfYT47CiAJcGluY3RybC0yID0gPCZzZG1tYzJfYjRfc2xlZXBfcGluc19hPjsKLQlicm9rZW4t
Y2Q7Ci0JZGlzYWJsZS13cDsKKwlub24tcmVtb3ZhYmxlOworCW5vLXNkOworCW5vLXNkaW87CiAJ
c3QsbmVnLWVkZ2U7CiAJYnVzLXdpZHRoID0gPDQ+OwogCXZtbWMtc3VwcGx5ID0gPCZ2M3YzPjsK
LS0gCjIuMzAuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4v
bGlzdGluZm8vdWJvb3Qtc3RtMzIK
