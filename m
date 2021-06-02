Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 71479399B42
	for <lists+uboot-stm32@lfdr.de>; Thu,  3 Jun 2021 09:08:08 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 16086C57B6F;
	Thu,  3 Jun 2021 07:08:08 +0000 (UTC)
Received: from mx01.ayax.eu (mx01.ayax.eu [188.137.98.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 14DD6C36B25
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  2 Jun 2021 17:09:07 +0000 (UTC)
Received: from [192.168.192.146] (port=55134 helo=nx64de-df6d00)
 by mx01.ayax.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <gszymaszek@short.pl>)
 id 1loUMa-0000X7-HN; Wed, 02 Jun 2021 19:09:04 +0200
Date: Wed, 2 Jun 2021 19:09:03 +0200
From: Grzegorz Szymaszek <gszymaszek@short.pl>
To: u-boot@lists.denx.de
Message-ID: <181587e59f14987c730d5a0c573407de1c59b511.1622651232.git.gszymaszek@short.pl>
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
Subject: [Uboot-stm32] [PATCH v2 2/5] arm: dts: stm32mp157c-odyssey-som:
 enable all SDMMC2 data lanes
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
bmF5IDxwYXRyaWNrLmRlbGF1bmF5QGZvc3Muc3QuY29tPgpSZXZpZXdlZC1ieTogUGF0cmljZSBD
aG90YXJkIDxwYXRyaWNlLmNob3RhcmRAZm9zcy5zdC5jb20+Ci0tLQpDaGFuZ2VzIGZvciB2MjoK
ICAgLSByZWJhc2VkIG9uIGN1cnJlbnQgbWFzdGVyIChwYXRjaCBub3QgY2hhbmdlZCkKICAgLSBh
ZGRlZCBQYXRyaWNlIENob3RhcmTigJlzIFJldmlld2VkLWJ5CgogYXJjaC9hcm0vZHRzL3N0bTMy
bXAxNTdjLW9keXNzZXktc29tLmR0c2kgfCA4ICsrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBp
bnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2R0cy9z
dG0zMm1wMTU3Yy1vZHlzc2V5LXNvbS5kdHNpIGIvYXJjaC9hcm0vZHRzL3N0bTMybXAxNTdjLW9k
eXNzZXktc29tLmR0c2kKaW5kZXggZWQzOTljMDBkMS4uNzMyMzMyNWU2MCAxMDA2NDQKLS0tIGEv
YXJjaC9hcm0vZHRzL3N0bTMybXAxNTdjLW9keXNzZXktc29tLmR0c2kKKysrIGIvYXJjaC9hcm0v
ZHRzL3N0bTMybXAxNTdjLW9keXNzZXktc29tLmR0c2kKQEAgLTI2NCwxNCArMjY0LDE0IEBACiAK
ICZzZG1tYzIgewogCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCIsICJvcGVuZHJhaW4iLCAic2xl
ZXAiOwotCXBpbmN0cmwtMCA9IDwmc2RtbWMyX2I0X3BpbnNfYT47Ci0JcGluY3RybC0xID0gPCZz
ZG1tYzJfYjRfb2RfcGluc19hPjsKLQlwaW5jdHJsLTIgPSA8JnNkbW1jMl9iNF9zbGVlcF9waW5z
X2E+OworCXBpbmN0cmwtMCA9IDwmc2RtbWMyX2I0X3BpbnNfYSAmc2RtbWMyX2Q0N19waW5zX2Q+
OworCXBpbmN0cmwtMSA9IDwmc2RtbWMyX2I0X29kX3BpbnNfYSAmc2RtbWMyX2Q0N19waW5zX2Q+
OworCXBpbmN0cmwtMiA9IDwmc2RtbWMyX2I0X3NsZWVwX3BpbnNfYSAmc2RtbWMyX2Q0N19zbGVl
cF9waW5zX2Q+OwogCW5vbi1yZW1vdmFibGU7CiAJbm8tc2Q7CiAJbm8tc2RpbzsKIAlzdCxuZWct
ZWRnZTsKLQlidXMtd2lkdGggPSA8ND47CisJYnVzLXdpZHRoID0gPDg+OwogCXZtbWMtc3VwcGx5
ID0gPCZ2M3YzPjsKIAlzdGF0dXMgPSAib2theSI7CiB9OwotLSAKMi4zMC4yCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5n
IGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
