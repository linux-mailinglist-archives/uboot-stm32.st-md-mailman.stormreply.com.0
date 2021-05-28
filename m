Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B2A39561D
	for <lists+uboot-stm32@lfdr.de>; Mon, 31 May 2021 09:30:42 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ED194C57B6F;
	Mon, 31 May 2021 07:30:41 +0000 (UTC)
Received: from mx01.ayax.eu (mx01.ayax.eu [188.137.98.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 616A3C57189
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 May 2021 16:54:31 +0000 (UTC)
Received: from [192.168.192.146] (port=39198 helo=nx64de-df6d00)
 by mx01.ayax.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <gszymaszek@short.pl>)
 id 1lmfki-0008BH-TL; Fri, 28 May 2021 18:54:29 +0200
Date: Fri, 28 May 2021 18:54:27 +0200
From: Grzegorz Szymaszek <gszymaszek@short.pl>
To: u-boot@lists.denx.de
Message-ID: <f36a3ba88b2f9b9f6ba2d09de1b0e99a7f1d23f8.1622220270.git.gszymaszek@short.pl>
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
Subject: [Uboot-stm32] [PATCH 2/5] arm: dts: stm32mp157c-odyssey-som: enable
 all SDMMC2 data lanes
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

QWRkIHRoZSDigJxzZG1tYzJfZDQ3X3BpbnNfZOKAnSBwaW5zIHRvIHRoZSBTRE1NQzIgcGluY3Ry
bHMuIEluY3JlYXNlIHRoZQpidXMgd2lkdGggZnJvbSBmb3VyIHRvIGVpZ2h0LgoKU2lnbmVkLW9m
Zi1ieTogR3J6ZWdvcnogU3p5bWFzemVrIDxnc3p5bWFzemVrQHNob3J0LnBsPgpDYzogUGF0cmlj
ZSBDaG90YXJkIDxwYXRyaWNlLmNob3RhcmRAZm9zcy5zdC5jb20+CkNjOiBQYXRyaWNrIERlbGF1
bmF5IDxwYXRyaWNrLmRlbGF1bmF5QGZvc3Muc3QuY29tPgotLS0KIGFyY2gvYXJtL2R0cy9zdG0z
Mm1wMTU3Yy1vZHlzc2V5LXNvbS5kdHNpIHwgOCArKysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDQg
aW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL2FybS9kdHMv
c3RtMzJtcDE1N2Mtb2R5c3NleS1zb20uZHRzaSBiL2FyY2gvYXJtL2R0cy9zdG0zMm1wMTU3Yy1v
ZHlzc2V5LXNvbS5kdHNpCmluZGV4IDVjNzU4YjBmNzIuLjU4MDFiN2E5NjggMTAwNjQ0Ci0tLSBh
L2FyY2gvYXJtL2R0cy9zdG0zMm1wMTU3Yy1vZHlzc2V5LXNvbS5kdHNpCisrKyBiL2FyY2gvYXJt
L2R0cy9zdG0zMm1wMTU3Yy1vZHlzc2V5LXNvbS5kdHNpCkBAIC0yNjAsMTQgKzI2MCwxNCBAQAog
CiAmc2RtbWMyIHsKIAlwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiLCAib3BlbmRyYWluIiwgInNs
ZWVwIjsKLQlwaW5jdHJsLTAgPSA8JnNkbW1jMl9iNF9waW5zX2E+OwotCXBpbmN0cmwtMSA9IDwm
c2RtbWMyX2I0X29kX3BpbnNfYT47Ci0JcGluY3RybC0yID0gPCZzZG1tYzJfYjRfc2xlZXBfcGlu
c19hPjsKKwlwaW5jdHJsLTAgPSA8JnNkbW1jMl9iNF9waW5zX2EgJnNkbW1jMl9kNDdfcGluc19k
PjsKKwlwaW5jdHJsLTEgPSA8JnNkbW1jMl9iNF9vZF9waW5zX2EgJnNkbW1jMl9kNDdfcGluc19k
PjsKKwlwaW5jdHJsLTIgPSA8JnNkbW1jMl9iNF9zbGVlcF9waW5zX2EgJnNkbW1jMl9kNDdfc2xl
ZXBfcGluc19kPjsKIAlub24tcmVtb3ZhYmxlOwogCW5vLXNkOwogCW5vLXNkaW87CiAJc3QsbmVn
LWVkZ2U7Ci0JYnVzLXdpZHRoID0gPDQ+OworCWJ1cy13aWR0aCA9IDw4PjsKIAl2bW1jLXN1cHBs
eSA9IDwmdjN2Mz47CiAJc3RhdHVzID0gIm9rYXkiOwogfTsKLS0gCjIuMzAuMgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGlu
ZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9z
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
