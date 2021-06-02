Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 474D2399B40
	for <lists+uboot-stm32@lfdr.de>; Thu,  3 Jun 2021 09:08:08 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EA751C57B55;
	Thu,  3 Jun 2021 07:08:07 +0000 (UTC)
Received: from mx01.ayax.eu (mx01.ayax.eu [188.137.98.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D58ACC36B25
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  2 Jun 2021 17:08:14 +0000 (UTC)
Received: from [192.168.192.146] (port=55126 helo=nx64de-df6d00)
 by mx01.ayax.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <gszymaszek@short.pl>)
 id 1loULe-0000WA-QZ; Wed, 02 Jun 2021 19:08:06 +0200
Date: Wed, 2 Jun 2021 19:08:05 +0200
From: Grzegorz Szymaszek <gszymaszek@short.pl>
To: u-boot@lists.denx.de
Message-ID: <cover.1622651232.git.gszymaszek@short.pl>
Mail-Followup-To: u-boot@lists.denx.de,
 Marcin Sloniewski <marcin.sloniewski@gmail.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com
MIME-Version: 1.0
Content-Disposition: inline
X-Mailman-Approved-At: Thu, 03 Jun 2021 07:08:06 +0000
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Marcin Sloniewski <marcin.sloniewski@gmail.com>
Subject: [Uboot-stm32] =?utf-8?q?=5BPATCH_v2_0/5=5D_arm=3A_dts=3A_stm32mp1?=
 =?utf-8?q?57c-odyssey-som=3A_sync_SDMMC2_with_Linux_and_TF=E2=80=91A?=
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

VGhpcyBwYXRjaHNldCB1cGRhdGVzIHRoZSBwcm9wZXJ0aWVzIG9mIHRoZSBTRE1NQzIgZGV2aWNl
IHRyZWUgbm9kZSBzbwp0aGF0IHRoZXkgbWF0Y2ggdGhlaXIgTGludXgga2VybmVsIGFuZCBUcnVz
dGVkIEZpcm13YXJlIEEgY291bnRlcnBhcnRzLgpUd28gZGlmZmVyZW5jZXMgd2lsbCByZW1haW46
CuKAlCBpbiB0aGUgTGludXgga2VybmVsIGRldmljZSB0cmVlLCB0aGUgVlFNTUMgc3VwcGx5IGlz
IGluY29ycmVjdGx5IHNldAogIHRvIHYzdjMgKGJ1Y2s0KSBpbnN0ZWFkIG9mIHZkZCAoYnVjazMp
OwrigJQgaW4gdGhlIFRG4oCRQSBkZXZpY2UgdHJlZSwgb25seSB0aGUg4oCcZGVmYXVsdOKAnSBw
aW5jdHJsIGlzIGNvbmZpZ3VyZWQuCgpBZGRpdGlvbmFsbHksIHRoaXMgcGF0Y2hzZXQgZW5hYmxl
cyBTRE1NQzIgaW4gU1BMLgoKQ2hhbmdlcyBmb3IgdjI6CuKAlCByZWJhc2VkIG9uIGN1cnJlbnQg
bWFzdGVyIChubyBjb2RlIGNoYW5nZXMpOwrigJQgYWRkZWQgUGF0cmljZSBDaG90YXJk4oCZcyBS
ZXZpZXdlZC1ieSAodGhhbmtzISk7CuKAlCBhZGRlZCBtaXNzaW5nIGNvbW1pdCBtZXNzYWdlIGJv
ZGllcy4KCkdyemVnb3J6IFN6eW1hc3playAoNSk6CiAgYXJtOiBkdHM6IHN0bTMybXAxNTdjLW9k
eXNzZXktc29tOiBmaXggdGhlIGJhc2ljIFNETU1DMiBwcm9wZXJ0aWVzCiAgYXJtOiBkdHM6IHN0
bTMybXAxNTdjLW9keXNzZXktc29tOiBlbmFibGUgYWxsIFNETU1DMiBkYXRhIGxhbmVzCiAgYXJt
OiBkdHM6IHN0bTMybXAxNTdjLW9keXNzZXktc29tOiBzZXQgdGhlIFNETU1DMiBWUU1NQyBzdXBw
bHkKICBhcm06IGR0czogc3RtMzJtcDE1N2Mtb2R5c3NleS1zb206IGVuYWJsZSB0aGUgU0RNTUMy
IGVNTUMgSFMgRERSIG1vZGUKICBhcm06IGR0czogc3RtMzJtcDE1N2Mtb2R5c3NleS1zb206IGVu
YWJsZSBTRE1NQzIgaW4gU1BMCgogLi4uL2R0cy9zdG0zMm1wMTU3Yy1vZHlzc2V5LXNvbS11LWJv
b3QuZHRzaSAgIHwgMjEgKysrKysrKysrKysrKysrKysrKwogYXJjaC9hcm0vZHRzL3N0bTMybXAx
NTdjLW9keXNzZXktc29tLmR0c2kgICAgIHwgMTUgKysrKysrKy0tLS0tLQogMiBmaWxlcyBjaGFu
Z2VkLCAzMCBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKLS0gCjIuMzAuMgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFp
bGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6
Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3Rt
MzIK
