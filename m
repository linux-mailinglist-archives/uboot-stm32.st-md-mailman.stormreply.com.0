Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5C1A5C3E4
	for <lists+uboot-stm32@lfdr.de>; Tue, 11 Mar 2025 15:35:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A45B3C78F85;
	Tue, 11 Mar 2025 14:35:00 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EAC93CFAC4C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Mar 2025 14:34:59 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52BACmRJ007329;
 Tue, 11 Mar 2025 15:34:57 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 J9p1MUcxKeny/IdBlrakxkiDPWKR21aNqBJhDWpT+AQ=; b=RNafezCKdm/X2CBw
 9ab4djuyEShvlZzNplJqsPsJN4YKwufiH0JuowJJTB2/3ZpUg+1mDubpDujZVb1a
 d5i65kM0zfHCX0JH6DXZjZfn7iYAaIXetilu3wH3SjNWNYhBL/BE/tXEoA3Wrew2
 tX4NIuPKDhYPyqbQtidvUbv5vuboKZfcxOfxaIECwusfyjZFgkcMwZ/pzIquw7mG
 k0NwmZBJ7yi8G/jVZwHqRFBnkqAVz9gpbQ9os4kJIJ6n6OOF/q7gkspvTn9nhj4H
 UQ4WM8LFCkpQZ7LGl4hBCf+vPFq6523Y8C5NnIgxwQ3fTDc3sfvzRNxb2joTSSeu
 KyK7zw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4591qs6gj8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Mar 2025 15:34:56 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 6D4144004F;
 Tue, 11 Mar 2025 15:33:33 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1F8BB59804B;
 Tue, 11 Mar 2025 15:31:28 +0100 (CET)
Received: from localhost (10.48.86.119) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 11 Mar
 2025 15:31:27 +0100
From: Cheick Traore <cheick.traore@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 11 Mar 2025 15:30:34 +0100
Message-ID: <20250311143037.818675-2-cheick.traore@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250311143037.818675-1-cheick.traore@foss.st.com>
References: <20250311143037.818675-1-cheick.traore@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.86.119]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-11_03,2025-03-11_02,2024-11-22_01
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Cheick Traore <cheick.traore@foss.st.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>
Subject: [Uboot-stm32] [PATCH v2 1/4] mach-stm32: add multifunction timer
	driver support
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

QWRkIHN1cHBvcnQgZm9yIFNUTTMyTVAgdGltZXIgbXVsdGktZnVuY3Rpb24gZHJpdmVyLgpUaGVz
ZSB0aW1lcnMgY2FuIGJlIHVzZSBhcyBjb3VudGVyLCB0cmlnZ2VyIG9yIHB3bSBnZW5lcmF0b3Iu
ClRoaXMgZHJpdmVyIHdpbGwgYmUgdXNlZCB0byBtYW5hZ2UgdGhlIG1haW4gcmVzb3VyY2VzIG9m
IHRoZSB0aW1lciB0bwpwcm92aWRlIHRoZW0gdG8gdGhlIGZ1bmN0aW9ubmFsaXRpZXMgd2hpY2gg
bmVlZCB0aGVzZSBvbmVzLgoKU2lnbmVkLW9mZi1ieTogQ2hlaWNrIFRyYW9yZSA8Y2hlaWNrLnRy
YW9yZUBmb3NzLnN0LmNvbT4KUmV2aWV3ZWQtYnk6IEZhYnJpY2UgR2FzbmllciA8ZmFicmljZS5n
YXNuaWVyQGZvc3Muc3QuY29tPgpSZXZpZXdlZC1ieTogUGF0cmljZSBDaG90YXJkIDxwYXRyaWNl
LmNob3RhcmRAZm9zcy5zdC5jb20+Ci0tLQoKKG5vIGNoYW5nZXMgc2luY2UgdjEpCgogYXJjaC9h
cm0vbWFjaC1zdG0zMm1wL0tjb25maWcgICAgICAgICAgICAgICB8ICA2ICsrCiBhcmNoL2FybS9t
YWNoLXN0bTMybXAvTWFrZWZpbGUgICAgICAgICAgICAgIHwgIDEgKwogYXJjaC9hcm0vbWFjaC1z
dG0zMm1wL2luY2x1ZGUvbWFjaC90aW1lcnMuaCB8IDU1ICsrKysrKysrKysrKysrCiBhcmNoL2Fy
bS9tYWNoLXN0bTMybXAvdGltZXJzLmMgICAgICAgICAgICAgIHwgODIgKysrKysrKysrKysrKysr
KysrKysrCiA0IGZpbGVzIGNoYW5nZWQsIDE0NCBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAx
MDA2NDQgYXJjaC9hcm0vbWFjaC1zdG0zMm1wL2luY2x1ZGUvbWFjaC90aW1lcnMuaAogY3JlYXRl
IG1vZGUgMTAwNjQ0IGFyY2gvYXJtL21hY2gtc3RtMzJtcC90aW1lcnMuYwoKZGlmZiAtLWdpdCBh
L2FyY2gvYXJtL21hY2gtc3RtMzJtcC9LY29uZmlnIGIvYXJjaC9hcm0vbWFjaC1zdG0zMm1wL0tj
b25maWcKaW5kZXggMjU2NjNhOTk0NjQuLjAwMmRhMmUzZDNiIDEwMDY0NAotLS0gYS9hcmNoL2Fy
bS9tYWNoLXN0bTMybXAvS2NvbmZpZworKysgYi9hcmNoL2FybS9tYWNoLXN0bTMybXAvS2NvbmZp
ZwpAQCAtMTUzLDYgKzE1MywxMiBAQCBjb25maWcgQ01EX1NUTTMyS0VZCiAJCVRoaXMgY29tbWFu
ZCBpcyB1c2VkIHRvIGV2YWx1YXRlIHRoZSBzZWN1cmUgYm9vdCBvbiBzdG0zMm1wIFNPQywKIAkJ
aXQgaXMgZGVhY3RpdmF0ZWQgYnkgZGVmYXVsdCBpbiByZWFsIHByb2R1Y3RzLgogCitjb25maWcg
TUZEX1NUTTMyX1RJTUVSUworCWJvb2wgIlNUTTMyIG11bHRpZm9uY3Rpb24gdGltZXIgc3VwcG9y
dCIKKwloZWxwCisJICBTZWxlY3QgdGhpcyB0byBlbmFibGUgc3VwcG9ydCBmb3IgdGhlIG11bHRp
ZnVuY3Rpb24gdGltZXIgZm91bmQgb24KKwkgIFNUTTMyIGRldmljZXMuCisKIHNvdXJjZSAiYXJj
aC9hcm0vbWFjaC1zdG0zMm1wL0tjb25maWcuMTN4Igogc291cmNlICJhcmNoL2FybS9tYWNoLXN0
bTMybXAvS2NvbmZpZy4xNXgiCiBzb3VyY2UgImFyY2gvYXJtL21hY2gtc3RtMzJtcC9LY29uZmln
LjI1eCIKZGlmZiAtLWdpdCBhL2FyY2gvYXJtL21hY2gtc3RtMzJtcC9NYWtlZmlsZSBiL2FyY2gv
YXJtL21hY2gtc3RtMzJtcC9NYWtlZmlsZQppbmRleCBkYjdlZDE5YmQ5MS4uMTAzZTM0MTBhZDkg
MTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL21hY2gtc3RtMzJtcC9NYWtlZmlsZQorKysgYi9hcmNoL2Fy
bS9tYWNoLXN0bTMybXAvTWFrZWZpbGUKQEAgLTEyLDYgKzEyLDcgQEAgb2JqLSQoQ09ORklHX1NU
TTMyTVAxNVgpICs9IHN0bTMybXAxLwogb2JqLSQoQ09ORklHX1NUTTMyTVAxM1gpICs9IHN0bTMy
bXAxLwogb2JqLSQoQ09ORklHX1NUTTMyTVAyNVgpICs9IHN0bTMybXAyLwogCitvYmotJChDT05G
SUdfTUZEX1NUTTMyX1RJTUVSUykgKz0gdGltZXJzLm8KIG9iai0kKENPTkZJR19TVE0zMl9FQ0RT
QV9WRVJJRlkpICs9IGVjZHNhX3JvbWFwaS5vCiBpZm5kZWYgQ09ORklHX1hQTF9CVUlMRAogb2Jq
LXkgKz0gY21kX3N0bTMycHJvZy8KZGlmZiAtLWdpdCBhL2FyY2gvYXJtL21hY2gtc3RtMzJtcC9p
bmNsdWRlL21hY2gvdGltZXJzLmggYi9hcmNoL2FybS9tYWNoLXN0bTMybXAvaW5jbHVkZS9tYWNo
L3RpbWVycy5oCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwLi5hODQ0NjVi
YjI4ZQotLS0gL2Rldi9udWxsCisrKyBiL2FyY2gvYXJtL21hY2gtc3RtMzJtcC9pbmNsdWRlL21h
Y2gvdGltZXJzLmgKQEAgLTAsMCArMSw1NSBAQAorLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6
IEdQTC0yLjAtb25seSAqLworLyoKKyAqIENvcHlyaWdodCAoQykgMjAyNSwgU1RNaWNyb2VsZWN0
cm9uaWNzIC0gQWxsIFJpZ2h0cyBSZXNlcnZlZAorICogQXV0aG9yOiBDaGVpY2sgVHJhb3JlIDxj
aGVpY2sudHJhb3JlQGZvc3Muc3QuY29tPgorICoKKyAqIE9yaWdpbmFsbHkgYmFzZWQgb24gdGhl
IExpbnV4IGtlcm5lbCB2Ni4xIGluY2x1ZGUvbGludXgvbWZkL3N0bTMyLXRpbWVycy5oLgorICov
CisKKyNpZm5kZWYgX19TVE0zMl9USU1FUlNfSAorI2RlZmluZSBfX1NUTTMyX1RJTUVSU19ICisK
KyNpbmNsdWRlIDxjbGsuaD4KKworI2RlZmluZSBUSU1fQ1IxCQkweDAwCS8qIENvbnRyb2wgUmVn
aXN0ZXIgMSAgICAgICovCisjZGVmaW5lIFRJTV9DUjIJCTB4MDQJLyogQ29udHJvbCBSZWdpc3Rl
ciAyICAgICAgKi8KKyNkZWZpbmUgVElNX1NNQ1IJMHgwOAkvKiBTbGF2ZSBtb2RlIGNvbnRyb2wg
cmVnICAqLworI2RlZmluZSBUSU1fRElFUgkweDBDCS8qIERNQS9pbnRlcnJ1cHQgcmVnaXN0ZXIg
ICovCisjZGVmaW5lIFRJTV9TUgkJMHgxMAkvKiBTdGF0dXMgcmVnaXN0ZXIJICAgKi8KKyNkZWZp
bmUgVElNX0VHUgkJMHgxNAkvKiBFdmVudCBHZW5lcmF0aW9uIFJlZyAgICAqLworI2RlZmluZSBU
SU1fQ0NNUjEJMHgxOAkvKiBDYXB0L0NvbXAgMSBNb2RlIFJlZyAgICAqLworI2RlZmluZSBUSU1f
Q0NNUjIJMHgxQwkvKiBDYXB0L0NvbXAgMiBNb2RlIFJlZyAgICAqLworI2RlZmluZSBUSU1fQ0NF
UgkweDIwCS8qIENhcHQvQ29tcCBFbmFibGUgUmVnICAgICovCisjZGVmaW5lIFRJTV9DTlQJCTB4
MjQJLyogQ291bnRlcgkJICAgKi8KKyNkZWZpbmUgVElNX1BTQwkJMHgyOAkvKiBQcmVzY2FsZXIg
ICAgICAgICAgICAgICAqLworI2RlZmluZSBUSU1fQVJSCQkweDJjCS8qIEF1dG8tUmVsb2FkIFJl
Z2lzdGVyICAgICovCisjZGVmaW5lIFRJTV9DQ1J4KHgpCSgweDM0ICsgNCAqICgoeCkgLSAxKSkJ
LyogQ2FwdC9Db21wIFJlZ2lzdGVyIHggKHgg4oiIIHsxLCAuLiA0fSkJKi8KKyNkZWZpbmUgVElN
X0JEVFIJMHg0NAkvKiBCcmVhayBhbmQgRGVhZC1UaW1lIFJlZyAqLworI2RlZmluZSBUSU1fRENS
CQkweDQ4CS8qIERNQSBjb250cm9sIHJlZ2lzdGVyICAgICovCisjZGVmaW5lIFRJTV9ETUFSCTB4
NEMJLyogRE1BIHJlZ2lzdGVyIGZvciB0cmFuc2ZlciAqLworI2RlZmluZSBUSU1fVElTRUwJMHg2
OAkvKiBJbnB1dCBTZWxlY3Rpb24gICAgICAgICAqLworCisjZGVmaW5lIFRJTV9DUjFfQ0VOCUJJ
VCgwKQkvKiBDb3VudGVyIEVuYWJsZQkgICAqLworI2RlZmluZSBUSU1fQ1IxX0FSUEUJQklUKDcp
CisjZGVmaW5lIFRJTV9DQ0VSX0NDWEUJKEJJVCgwKSB8IEJJVCg0KSB8IEJJVCg4KSB8IEJJVCgx
MikpCisjZGVmaW5lIFRJTV9DQ0VSX0NDMUUJQklUKDApCisjZGVmaW5lIFRJTV9DQ0VSX0NDMVAJ
QklUKDEpCS8qIENhcHQvQ29tcCAxICBQb2xhcml0eSAgICovCisjZGVmaW5lIFRJTV9DQ0VSX0ND
MU5FCUJJVCgyKQkvKiBDYXB0L0NvbXAgMU4gb3V0IEVuYSAgICAqLworI2RlZmluZSBUSU1fQ0NF
Ul9DQzFOUAlCSVQoMykJLyogQ2FwdC9Db21wIDFOIFBvbGFyaXR5ICAgKi8KKyNkZWZpbmUgVElN
X0NDTVJfUEUJQklUKDMpCS8qIENoYW5uZWwgUHJlbG9hZCBFbmFibGUgICovCisjZGVmaW5lIFRJ
TV9DQ01SX00xCShCSVQoNikgfCBCSVQoNSkpICAvKiBDaGFubmVsIFBXTSBNb2RlIDEgKi8KKyNk
ZWZpbmUgVElNX0JEVFJfTU9FCUJJVCgxNSkJLyogTWFpbiBPdXRwdXQgRW5hYmxlICAgICAgKi8K
KyNkZWZpbmUgVElNX0VHUl9VRwlCSVQoMCkJLyogVXBkYXRlIEdlbmVyYXRpb24gICAgICAgKi8K
KworI2RlZmluZSBNQVhfVElNX1BTQwkJMHhGRkZGCisKK3N0cnVjdCBzdG0zMl90aW1lcnNfcGxh
dCB7CisJdm9pZCBfX2lvbWVtICpiYXNlOworfTsKKworc3RydWN0IHN0bTMyX3RpbWVyc19wcml2
IHsKKwl1MzIgbWF4X2FycjsKKwl1bG9uZyByYXRlOworfTsKKworI2VuZGlmCmRpZmYgLS1naXQg
YS9hcmNoL2FybS9tYWNoLXN0bTMybXAvdGltZXJzLmMgYi9hcmNoL2FybS9tYWNoLXN0bTMybXAv
dGltZXJzLmMKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAuLmEzMjA3ODk1
ZjQwCi0tLSAvZGV2L251bGwKKysrIGIvYXJjaC9hcm0vbWFjaC1zdG0zMm1wL3RpbWVycy5jCkBA
IC0wLDAgKzEsODIgQEAKKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkK
Ky8qCisgKiBDb3B5cmlnaHQgKEMpIDIwMjUsIFNUTWljcm9lbGVjdHJvbmljcyAtIEFsbCBSaWdo
dHMgUmVzZXJ2ZWQKKyAqIEF1dGhvcjogQ2hlaWNrIFRyYW9yZSA8Y2hlaWNrLnRyYW9yZUBmb3Nz
LnN0LmNvbT4KKyAqCisgKiBPcmlnaW5hbGx5IGJhc2VkIG9uIHRoZSBMaW51eCBrZXJuZWwgdjYu
MSBkcml2ZXJzL21mZC9zdG0zMi10aW1lcnMuYy4KKyAqLworCisjaW5jbHVkZSA8ZG0uaD4KKyNp
bmNsdWRlIDxhc20vaW8uaD4KKyNpbmNsdWRlIDxhc20vYXJjaC90aW1lcnMuaD4KKyNpbmNsdWRl
IDxkbS9kZXZpY2VfY29tcGF0Lmg+CisKK3N0YXRpYyB2b2lkIHN0bTMyX3RpbWVyc19nZXRfYXJy
X3NpemUoc3RydWN0IHVkZXZpY2UgKmRldikKK3sKKwlzdHJ1Y3Qgc3RtMzJfdGltZXJzX3BsYXQg
KnBsYXQgPSBkZXZfZ2V0X3BsYXQoZGV2KTsKKwlzdHJ1Y3Qgc3RtMzJfdGltZXJzX3ByaXYgKnBy
aXYgPSBkZXZfZ2V0X3ByaXYoZGV2KTsKKwl1MzIgYXJyOworCisJLyogQmFja3VwIEFSUiB0byBy
ZXN0b3JlIGl0IGFmdGVyIGdldHRpbmcgdGhlIG1heGltdW0gdmFsdWUgKi8KKwlhcnIgPSByZWFk
bChwbGF0LT5iYXNlICsgVElNX0FSUik7CisKKwkvKgorCSAqIE9ubHkgdGhlIGF2YWlsYWJsZSBi
aXRzIHdpbGwgYmUgd3JpdHRlbiBzbyB3aGVuIHJlYWRiYWNrCisJICogd2UgZ2V0IHRoZSBtYXhp
bXVtIHZhbHVlIG9mIGF1dG8gcmVsb2FkIHJlZ2lzdGVyCisJICovCisJd3JpdGVsKH4wTCwgcGxh
dC0+YmFzZSArIFRJTV9BUlIpOworCXByaXYtPm1heF9hcnIgPSByZWFkbChwbGF0LT5iYXNlICsg
VElNX0FSUik7CisJd3JpdGVsKGFyciwgcGxhdC0+YmFzZSArIFRJTV9BUlIpOworfQorCitzdGF0
aWMgaW50IHN0bTMyX3RpbWVyc19vZl90b19wbGF0KHN0cnVjdCB1ZGV2aWNlICpkZXYpCit7CisJ
c3RydWN0IHN0bTMyX3RpbWVyc19wbGF0ICpwbGF0ID0gZGV2X2dldF9wbGF0KGRldik7CisKKwlw
bGF0LT5iYXNlID0gZGV2X3JlYWRfYWRkcl9wdHIoZGV2KTsKKwlpZiAoIXBsYXQtPmJhc2UpIHsK
KwkJZGV2X2VycihkZXYsICJjYW4ndCBnZXQgYWRkcmVzc1xuIik7CisJCXJldHVybiAtRU5PRU5U
OworCX0KKworCXJldHVybiAwOworfQorCitzdGF0aWMgaW50IHN0bTMyX3RpbWVyc19wcm9iZShz
dHJ1Y3QgdWRldmljZSAqZGV2KQoreworCXN0cnVjdCBzdG0zMl90aW1lcnNfcHJpdiAqcHJpdiA9
IGRldl9nZXRfcHJpdihkZXYpOworCXN0cnVjdCBjbGsgY2xrOworCWludCByZXQgPSAwOworCisJ
cmV0ID0gY2xrX2dldF9ieV9pbmRleChkZXYsIDAsICZjbGspOworCWlmIChyZXQgPCAwKQorCQly
ZXR1cm4gcmV0OworCisJcmV0ID0gY2xrX2VuYWJsZSgmY2xrKTsKKwlpZiAocmV0KSB7CisJCWRl
dl9lcnIoZGV2LCAiZmFpbGVkIHRvIGVuYWJsZSBjbG9jazogcmV0PSVkXG4iLCByZXQpOworCQly
ZXR1cm4gcmV0OworCX0KKworCXByaXYtPnJhdGUgPSBjbGtfZ2V0X3JhdGUoJmNsayk7CisKKwlz
dG0zMl90aW1lcnNfZ2V0X2Fycl9zaXplKGRldik7CisKKwlyZXR1cm4gcmV0OworfQorCitzdGF0
aWMgY29uc3Qgc3RydWN0IHVkZXZpY2VfaWQgc3RtMzJfdGltZXJzX2lkc1tdID0geworCXsgLmNv
bXBhdGlibGUgPSAic3Qsc3RtMzItdGltZXJzIiB9LAorCXt9Cit9OworCitVX0JPT1RfRFJJVkVS
KHN0bTMyX3RpbWVycykgPSB7CisJLm5hbWUgID0gInN0bTMyX3RpbWVycyIsCisJLmlkID0gVUNM
QVNTX05PUCwKKwkub2ZfbWF0Y2ggPSBzdG0zMl90aW1lcnNfaWRzLAorCS5vZl90b19wbGF0ID0g
c3RtMzJfdGltZXJzX29mX3RvX3BsYXQsCisJLnBsYXRfYXV0byA9IHNpemVvZihzdHJ1Y3Qgc3Rt
MzJfdGltZXJzX3BsYXQpLAorCS5wcm9iZSA9IHN0bTMyX3RpbWVyc19wcm9iZSwKKwkucHJpdl9h
dXRvID0gc2l6ZW9mKHN0cnVjdCBzdG0zMl90aW1lcnNfcHJpdiksCisJLmJpbmQgPSBkbV9zY2Fu
X2ZkdF9kZXYsCit9OwotLSAKMi4zNC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
