Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D4367315248
	for <lists+uboot-stm32@lfdr.de>; Tue,  9 Feb 2021 16:02:38 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9ED17C57189;
	Tue,  9 Feb 2021 15:02:38 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E4B58C3087A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Feb 2021 15:02:35 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 119ErELU017342; Tue, 9 Feb 2021 16:02:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=to : cc : from :
 subject : message-id : date : mime-version : content-type :
 content-transfer-encoding; s=selector1;
 bh=jyQbFh1WvGfVZUIfxhXc5Zwb5dU/zgEyDekf/ojTnd4=;
 b=37+Thf+U7SBMC+Z/DU19TPMBjt7g2gH63i5BBi6SOIb/5wVw4ioVoA4pAnM70PvGnzpg
 VvZTxhcIngOXLfNascqroUBd8n+h5NVgcNaLM7owkt0/eJbZrQVYWDdTm/yuhamEGhVn
 yzdVrMkDFgRGCWXLhrY3FnonvGkIMDInJxqhu3/S7MyOlvjA2ZdX2MAS8nrIyhn01MHw
 RbnPVCtAtPeYyPGFBoYusPAit3QDsq2wUJ+hs/5AlxkeD1YxHVDrv7xjMrd1T8hrWi7n
 s9nhbA02DhIO1ctpCZa2P4db79JZBVWpEz88FOGhwdI7hXHfPYcvumgTqJj/6jJ+Clzo MQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36hrf79cn1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Feb 2021 16:02:33 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A7EF710002A;
 Tue,  9 Feb 2021 16:02:31 +0100 (CET)
Received: from Webmail-eu.st.com (gpxdag2node6.st.com [10.75.127.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9BDE825D017;
 Tue,  9 Feb 2021 16:02:31 +0100 (CET)
Received: from lmecxl0994.lme.st.com (10.75.127.117) by GPXDAG2NODE6.st.com
 (10.75.127.70) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 9 Feb
 2021 16:02:30 +0100
To: Tom Rini <trini@konsulko.com>, U-Boot Mailing List <u-boot@lists.denx.de>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <4966413e-eb02-fcab-f221-05fd83aa0acd@foss.st.com>
Date: Tue, 9 Feb 2021 16:02:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Language: en-US
X-Originating-IP: [10.75.127.117]
X-ClientProxiedBy: GPXDAG3NODE4.st.com (10.75.127.71) To GPXDAG2NODE6.st.com
 (10.75.127.70)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-09_03:2021-02-09,
 2021-02-09 signatures=0
Cc: Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PULL] Pull request for u-boot master / v2021.04 =
 u-boot-stm32-20210209
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

CkhpIFRvbSwKClBsZWFzZSBwdWxsIHRoZSBTVE0zMiByZWxhdGVkIHBhdGNoZXMgZm9yIHUtYm9v
dC9tYXN0ZXIsIHYyMDIxLjA0OiAKdS1ib290LXN0bTMyLTIwMjEwMjA5CgotIEVuYWJsZSB0aGUg
ZmFzdGJvb3Qgb2VtIGNvbW1hbmRzIGluIHN0bTMybXAxNSBkZWZjb25maWcKLSBGaXhlcyBwaW5j
dHJvbCBmb3Igc3RtZnggYW5kIHN0bTMyCi0gQWRkIHN1cHBvcnQgb2YgSTJDNl9LIGluIHN0bTMy
bXAxNSBjbG9jayBkcml2ZXIKLSBBbGlnbm1lbnQgd2l0aCBMaW51eCBrZXJuZWwgZGV2aWNlIHRy
ZWUgdjUuMTEtcmMyIGZvciBTVCBib2FyZHMKCkNJIHN0YXR1czogCmh0dHBzOi8vZ2l0bGFiLmRl
bnguZGUvdS1ib290L2N1c3RvZGlhbnMvdS1ib290LXN0bS8tL3BpcGVsaW5lcy82MzI2CgpUaGFu
a3MsClBhdHJpYwoKZ2l0IHJlcXVlc3QtcHVsbCBvcmlnaW4vbWFzdGVyIApodHRwczovL2dpdGxh
Yi5kZW54LmRlL3UtYm9vdC9jdXN0b2RpYW5zL3UtYm9vdC1zdG0uZ2l0IAp1LWJvb3Qtc3RtMzIt
MjAyMTAyMDkKClRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgZTE0ZDU3NjJkZTFk
Yjg0Y2FlNmQ4NGQ1OWMxZTQwZjNlYjI2YzRjMzoKCiDCoCBNZXJnZSBnaXQ6Ly9naXQuZGVueC5k
ZS91LWJvb3QtbWFydmVsbCAoMjAyMS0wMi0wOCAxMDo1NTo1MSAtMDUwMCkKCmFyZSBhdmFpbGFi
bGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0OgoKIMKgIGh0dHBzOi8vZ2l0bGFiLmRlbnguZGUv
dS1ib290L2N1c3RvZGlhbnMvdS1ib290LXN0bS5naXQgCnRhZ3MvdS1ib290LXN0bTMyLTIwMjEw
MjA5Cgpmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8gZjA1MGUzZmU0NTUyZGM4ZTI0YjFm
MDFkMjZiODM1ZWViNzYyYzQ2NzoKCiDCoCBhcm06IGR0czogc3RtMzJtcDE1OiBhbGlnbm1lbnQg
d2l0aCB2NS4xMS1yYzIgKDIwMjEtMDItMDkgMTA6NTY6MDYgKzAxMDApCgotLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCi0gRW5h
YmxlIHRoZSBmYXN0Ym9vdCBvZW0gY29tbWFuZHMgaW4gc3RtMzJtcDE1IGRlZmNvbmZpZwotIEZp
eGVzIHBpbmN0cm9sIGZvciBzdG1meCBhbmQgc3RtMzIKLSBBZGQgc3VwcG9ydCBvZiBJMkM2X0sg
aW4gc3RtMzJtcDE1IGNsb2NrIGRyaXZlcgotIEFsaWdubWVudCB3aXRoIExpbnV4IGtlcm5lbCBk
ZXZpY2UgdHJlZSB2NS4xMS1yYzIgZm9yIFNUIGJvYXJkcwoKLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpGYWJyaWNlIEdJUkFS
RE9UICgxKToKIMKgwqDCoMKgwqAgQVJNOiBkdHM6IHN0bTMyOiBGaXggY29zbWV0aWMgdHlwbzog
dXNlICdrSHonIGFzIGtpbG9oZXJ0eiAKYWJicmV2aWF0aW9uCgpKZWFuLVBoaWxpcHBlIFJPTUFJ
TiAoMik6CiDCoMKgwqDCoMKgIGNvbmZpZ3M6IHN0bTMybXAxOiBlbmFibGUgZmFzdGJvb3Qgc3Vw
cG9ydCBvZiBlTU1DIGJvb3QgcGFydGl0aW9uCiDCoMKgwqDCoMKgIGNvbmZpZ3M6IHN0bTMybXAx
OiBlbmFibGUgdGhlIGZhc3Rib290IG9lbSBjb21tYW5kIGZvcm1hdAoKUGF0cmljZSBDaG90YXJk
ICgyKToKIMKgwqDCoMKgwqAgcGluY3RybDogc3RtZng6IEZpeCBwaW4gY29uZmlndXJhdGlvbiBp
c3N1ZQogwqDCoMKgwqDCoCBwaW5jdHJsOiBzdG1meDogVXNlIFBJTk5BTUVfU0laRSBmb3IgcGlu
J3MgbmFtZSBzaXplCgpQYXRyaWNrIERlbGF1bmF5ICg2KToKIMKgwqDCoMKgwqAgY29uZmlnczog
c3RtMzJtcDE6IGVuYWJsZSB0aGUgZmFzdGJvb3Qgb2VtIGNvbW1hbmQgcGFydGNvbmYKIMKgwqDC
oMKgwqAgY29uZmlnczogc3RtMzJtcDE6IGVuYWJsZSB0aGUgZmFzdGJvb3Qgb2VtIGNvbW1hbmQg
Ym9vdGJ1cwogwqDCoMKgwqDCoCBwaW5jdHJsOiBzdG0zMjogY29ycmVjdCBtYW5hZ2VtZW50IHBp
biBkaXNwbGF5IG9mIE9UWVBFCiDCoMKgwqDCoMKgIHBpbmN0cmw6IHN0bTMyOiBiaW5kIG9ubHkg
dGhlIGVuYWJsZWQgR1BJTyBzdWJub2RlCiDCoMKgwqDCoMKgIGNsazogc3RtMzJtcDE6IGFkZCBz
dXBwb3J0IG9mIEkyQzZfSwogwqDCoMKgwqDCoCBhcm06IGR0czogc3RtMzJtcDE1OiBhbGlnbm1l
bnQgd2l0aCB2NS4xMS1yYzIKCiDCoGFyY2gvYXJtL2R0cy9zdG0zMm1wMTUtZGRyMy0xeDRHYi0x
MDY2LWJpbkcuZHRzaSB8wqAgMiArLQogwqBhcmNoL2FybS9kdHMvc3RtMzJtcDE1LWRkcjMtMng0
R2ItMTA2Ni1iaW5HLmR0c2kgfMKgIDIgKy0KIMKgYXJjaC9hcm0vZHRzL3N0bTMybXAxNS1waW5j
dHJsLmR0c2nCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDg3IAorKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLQogwqBhcmNoL2FybS9kdHMvc3Rt
MzJtcDE1MS5kdHNpwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDQ4
IAorKysrKysrKysrKysrKysrKysrKystLS0tLS0tLQogwqBhcmNoL2FybS9kdHMvc3RtMzJtcDE1
My5kdHNpwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgNiArKysr
CiDCoGFyY2gvYXJtL2R0cy9zdG0zMm1wMTU3Yy1kazIuZHRzwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgfMKgIDQgKysrCiDCoGFyY2gvYXJtL2R0cy9zdG0zMm1wMTU3Yy1lZDEuZHRz
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAyNyArKysrKysrKysrKysrKysrKwog
wqBhcmNoL2FybS9kdHMvc3RtMzJtcDE1N2MtZXYxLmR0c8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHzCoCAxICsKIMKgYXJjaC9hcm0vZHRzL3N0bTMybXAxNXh4LWRoY29tLXUtYm9v
dC5kdHNpwqDCoMKgwqDCoMKgIHwgNTUgCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQogwqBhcmNoL2FybS9kdHMvc3RtMzJtcDE1eHgtZGt4LmR0c2nCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgfCA0NyAKKysrKysrKysrKysrKysrKysrKysrKysrKystLS0KIMKgY29uZmln
cy9zdG0zMm1wMTVfYmFzaWNfZGVmY29uZmlnwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHzCoCA4ICsrKysrCiDCoGNvbmZpZ3Mvc3RtMzJtcDE1X3RydXN0ZWRfZGVmY29uZmlnwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDggKysrKysKIMKgZHJpdmVycy9jbGsvY2xrX3N0bTMy
bXAxLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMSAr
CiDCoGRyaXZlcnMvcGluY3RybC9waW5jdHJsLXN0bWZ4LmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHwgMTEgKysrLS0tLQogwqBkcml2ZXJzL3BpbmN0cmwvcGluY3RybF9zdG0z
Mi5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDIxICsrKysrKystLS0tLS0K
IMKgaW5jbHVkZS9jb25maWdzL3N0bTMybXAxLmjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCB8IDE0ICsrKysrKysrKwogwqAxNiBmaWxlcyBjaGFuZ2VkLCAyNDkg
aW5zZXJ0aW9ucygrKSwgOTMgZGVsZXRpb25zKC0pCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3Rt
MzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
