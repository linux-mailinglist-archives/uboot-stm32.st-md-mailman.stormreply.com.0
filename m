Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BD431399B44
	for <lists+uboot-stm32@lfdr.de>; Thu,  3 Jun 2021 09:08:08 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2BBC8C57B78;
	Thu,  3 Jun 2021 07:08:08 +0000 (UTC)
Received: from mx01.ayax.eu (mx01.ayax.eu [188.137.98.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 709E0C36B25
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  2 Jun 2021 17:09:11 +0000 (UTC)
Received: from [192.168.192.146] (port=55138 helo=nx64de-df6d00)
 by mx01.ayax.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <gszymaszek@short.pl>)
 id 1loUMf-0000XJ-Fn; Wed, 02 Jun 2021 19:09:09 +0200
Date: Wed, 2 Jun 2021 19:09:08 +0200
From: Grzegorz Szymaszek <gszymaszek@short.pl>
To: u-boot@lists.denx.de
Message-ID: <908739807bd46fca81a4636bef0736a68de8c431.1622651232.git.gszymaszek@short.pl>
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
Subject: [Uboot-stm32] [PATCH v2 3/5] arm: dts: stm32mp157c-odyssey-som: set
 the SDMMC2 VQMMC supply
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

U2V0IHRoZSBTRE1NQzIgVlFNTUMgc3VwcGx5IHRvIHZkZCAoYnVjazMpLiBOb3RlIHRoYXQgaW4g
dGhlCmNvcnJlc3BvbmRpbmcgTGludXgga2VybmVsIGRldmljZSB0cmVlLCB0aGUgc3VwcGx5IGlz
IHNldCB0byB2M3YzCihidWNrNCksIHdoaWNoIGlzIHdyb25nLgoKU2lnbmVkLW9mZi1ieTogR3J6
ZWdvcnogU3p5bWFzemVrIDxnc3p5bWFzemVrQHNob3J0LnBsPgpDYzogUGF0cmljZSBDaG90YXJk
IDxwYXRyaWNlLmNob3RhcmRAZm9zcy5zdC5jb20+CkNjOiBQYXRyaWNrIERlbGF1bmF5IDxwYXRy
aWNrLmRlbGF1bmF5QGZvc3Muc3QuY29tPgpSZXZpZXdlZC1ieTogUGF0cmljZSBDaG90YXJkIDxw
YXRyaWNlLmNob3RhcmRAZm9zcy5zdC5jb20+Ci0tLQpDaGFuZ2VzIGZvciB2MjoKICAgLSByZWJh
c2VkIG9uIGN1cnJlbnQgbWFzdGVyIChwYXRjaCBub3QgY2hhbmdlZCkKICAgLSBhZGRlZCBQYXRy
aWNlIENob3RhcmTigJlzIFJldmlld2VkLWJ5CgogYXJjaC9hcm0vZHRzL3N0bTMybXAxNTdjLW9k
eXNzZXktc29tLmR0c2kgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlm
ZiAtLWdpdCBhL2FyY2gvYXJtL2R0cy9zdG0zMm1wMTU3Yy1vZHlzc2V5LXNvbS5kdHNpIGIvYXJj
aC9hcm0vZHRzL3N0bTMybXAxNTdjLW9keXNzZXktc29tLmR0c2kKaW5kZXggNzMyMzMyNWU2MC4u
NTgzODEyZjEzNyAxMDA2NDQKLS0tIGEvYXJjaC9hcm0vZHRzL3N0bTMybXAxNTdjLW9keXNzZXkt
c29tLmR0c2kKKysrIGIvYXJjaC9hcm0vZHRzL3N0bTMybXAxNTdjLW9keXNzZXktc29tLmR0c2kK
QEAgLTI3Myw2ICsyNzMsNyBAQAogCXN0LG5lZy1lZGdlOwogCWJ1cy13aWR0aCA9IDw4PjsKIAl2
bW1jLXN1cHBseSA9IDwmdjN2Mz47CisJdnFtbWMtc3VwcGx5ID0gPCZ2ZGQ+OwogCXN0YXR1cyA9
ICJva2F5IjsKIH07CiAKLS0gCjIuMzAuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
