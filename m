Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 883A03D0B8F
	for <lists+uboot-stm32@lfdr.de>; Wed, 21 Jul 2021 11:45:56 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3DC68C597BD;
	Wed, 21 Jul 2021 09:45:56 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9554BCFAC5A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Jul 2021 09:45:54 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16L9hXJT009285; Wed, 21 Jul 2021 11:45:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=selector1;
 bh=9u3CjJe+f0ySkipMkcPdQJEIYC2uVF+DOnK5aWalJtQ=;
 b=kseV6JG2b7m/iuHnVh91NoT7vmEGKc64rWTOSn1nkErqdRkrHKKbnMmoiosydRhv6Pg6
 k59c0oyyywzXDgHUpXPrZFxCnbxWgDziqrJnvAIDwRd4FZExNiIlg399Ic38tQHExrS6
 /+tleHvyCrAY4qpU4YR70AhGquANrgF+lQzOQHNTFmE4y9Snlr448UB2jp+0IAYiDoA1
 CWEBF11xs4E+VdjvamlZx4Z3C8oJ+Hvw8XCtv68YgYsvmR0Dk3OhE+JYsT05vm7+27ue
 k7/SyuYccNuZKgVoqg4QoSWsYIJarMcNGp+CCL6/7oqS76t1pjNy4DQHxEUtWUXvIVvT /Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39xefy14dj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Jul 2021 11:45:52 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 79F0010002A;
 Wed, 21 Jul 2021 11:45:51 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 687CF21E66B;
 Wed, 21 Jul 2021 11:45:51 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 21 Jul 2021 11:45:50
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 21 Jul 2021 11:45:41 +0200
Message-ID: <20210721114521.1.I6630d4cc18870d3e830587ffbcb61898dc045cb6@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-21_04:2021-07-21,
 2021-07-21 signatures=0
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>
Subject: [Uboot-stm32] [PATCH] patman: add warning for invalid tag
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

QWRkIGEgZXJyb3IgaW4gcGF0bWFuIHRvb2wgd2hlbiB0aGUgY29tbWl0IG1lc3NhZ2UgY29udGVu
dHMgYW4gaW52YWxpZAp0YWcgIlNlcmllLS4qIiBpbnN0ZWFkIG9mICJTZXJpZXMtLioiLgoKU2ln
bmVkLW9mZi1ieTogUGF0cmljayBEZWxhdW5heSA8cGF0cmljay5kZWxhdW5heUBmb3NzLnN0LmNv
bT4KLS0tCkkgY3JlYXRlIHRoaXMgcGF0Y2ggdG8gYXZvaWQgbXkgZnJlcXVlbnQgbWlzdGFrZToK
dXNpbmcgIlNlcmllLSIgdGFnIGluc3RlYWQgb2YgIlNlcmllcy0iIGFzIGl0IGlzIGRvbmUgaW4g
WzFdLgoKUkVfSU5WX1RBRyBjYW4gYmUgZXh0ZW5kZWQgdG8gb3RoZXIgZnJlcXVlbnQgZXJyb3Jz
LgoKQW55ICJTZXJpZS0iIHRhZyBpcyByZWZ1c2VkIHdpdGggdGhlIHBhdGNoLCBmb3IgZXhhbXBs
ZToKClZhbHVlRXJyb3I6IExpbmUgMjg6IEludmFsaWQgdGFnID0KICAgJ1NlcmllLWNjOiBNYXJl
ayBCZWjDum4gPG1hcmVrLmJlaHVuQG5pYy5jej4nCgpbMV0gaHR0cDovL3BhdGNod29yay5vemxh
YnMub3JnL3Byb2plY3QvdWJvb3QvcGF0Y2gvMjAyMTA3MjAyMDMzNTMuMS5JNTUwYjk1ZjZkMTJk
NTlhZWVmNWI3NDRkODM3ZGJiMzYwMDM3ZDM5ZUBjaGFuZ2VpZC8KCgogdG9vbHMvcGF0bWFuL3Bh
dGNoc3RyZWFtLnB5IHwgOSArKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMo
KykKCmRpZmYgLS1naXQgYS90b29scy9wYXRtYW4vcGF0Y2hzdHJlYW0ucHkgYi90b29scy9wYXRt
YW4vcGF0Y2hzdHJlYW0ucHkKaW5kZXggYTQ0Y2Q4NjFhZi4uYjk2MDI5MjQyNyAxMDA2NDQKLS0t
IGEvdG9vbHMvcGF0bWFuL3BhdGNoc3RyZWFtLnB5CisrKyBiL3Rvb2xzL3BhdG1hbi9wYXRjaHN0
cmVhbS5weQpAQCAtNTksNiArNTksOSBAQCBSRV9ESUZGID0gcmUuY29tcGlsZShyJ14+LipkaWZm
IC0tZ2l0IGEvKC4qKSBiLyguKikkJykKICMgRGV0ZWN0IGEgY29udGV4dCBsaW5lLCBsaWtlICc+
IEBAIC0xNTMsOCArMTUzLDEzIEBAIENoZWNrUGF0Y2gKIFJFX0xJTkUgPSByZS5jb21waWxlKHIn
Pi4qQEAgXC0oXGQrKSxcZCsgXCsoXGQrKSxcZCsgQEAgKiguKiknKQogCisjIERldGVjdCBsaW5l
IHdpdGggaW52YWxpZCBUQUcKK1JFX0lOVl9UQUcgPSByZS5jb21waWxlKCdeU2VyaWUtKFthLXot
XSopOiAqKC4qKScpCisKICMgU3RhdGVzIHdlIGNhbiBiZSBpbiAtIGNhbiB3ZSB1c2UgcmFuZ2Uo
KSBhbmQgc3RpbGwgaGF2ZSBjb21tZW50cz8KIFNUQVRFX01TR19IRUFERVIgPSAwICAgICAgICAj
IFN0aWxsIGluIHRoZSBtZXNzYWdlIGhlYWRlcgogU1RBVEVfUEFUQ0hfU1VCSkVDVCA9IDEgICAg
ICMgSW4gcGF0Y2ggc3ViamVjdCAoZmlyc3QgbGluZSBvZiBsb2cgZm9yIGEgY29tbWl0KQpAQCAt
MzE4LDYgKzMyMSw3IEBAIGNsYXNzIFBhdGNoU3RyZWFtOgogICAgICAgICBsZWFkaW5nX3doaXRl
c3BhY2VfbWF0Y2ggPSBSRV9MRUFESU5HX1dISVRFU1BBQ0UubWF0Y2gobGluZSkKICAgICAgICAg
ZGlmZl9tYXRjaCA9IFJFX0RJRkYubWF0Y2gobGluZSkKICAgICAgICAgbGluZV9tYXRjaCA9IFJF
X0xJTkUubWF0Y2gobGluZSkKKyAgICAgICAgaW52YWxpZF9tYXRjaCA9IFJFX0lOVl9UQUcubWF0
Y2gobGluZSkKICAgICAgICAgdGFnX21hdGNoID0gTm9uZQogICAgICAgICBpZiBzZWxmLnN0YXRl
ID09IFNUQVRFX1BBVENIX0hFQURFUjoKICAgICAgICAgICAgIHRhZ19tYXRjaCA9IFJFX1RBRy5t
YXRjaChsaW5lKQpAQCAtNDcxLDYgKzQ3NSwxMSBAQCBjbGFzcyBQYXRjaFN0cmVhbToKICAgICAg
ICAgICAgICAgICBzZWxmLl9hZGRfd2FybignTGluZSAlZDogSWdub3JpbmcgQ29tbWl0LSVzJyAl
CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKHNlbGYubGluZW51bSwgbmFtZSkpCiAK
KyAgICAgICAgIyBEZXRlY3QgaW52YWxpZCB0YWdzCisgICAgICAgIGVsaWYgaW52YWxpZF9tYXRj
aDoKKyAgICAgICAgICAgIHJhaXNlIFZhbHVlRXJyb3IoIkxpbmUgJWQ6IEludmFsaWQgdGFnID0g
JyVzJyIgJQorICAgICAgICAgICAgICAgIChzZWxmLmxpbmVudW0sIGxpbmUpKQorCiAgICAgICAg
ICMgRGV0ZWN0IHRoZSBzdGFydCBvZiBhIG5ldyBjb21taXQKICAgICAgICAgZWxpZiBjb21taXRf
bWF0Y2g6CiAgICAgICAgICAgICBzZWxmLl9jbG9zZV9jb21taXQoKQotLSAKMi4yNS4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBt
YWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRw
czovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1z
dG0zMgo=
