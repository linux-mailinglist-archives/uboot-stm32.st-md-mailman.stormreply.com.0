Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4167F5B1632
	for <lists+uboot-stm32@lfdr.de>; Thu,  8 Sep 2022 10:03:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 005CCC63327;
	Thu,  8 Sep 2022 08:03:50 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CFBF4C63325
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Sep 2022 08:03:48 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2887SXlE031613;
 Thu, 8 Sep 2022 10:03:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : to : cc : from : subject : content-type :
 content-transfer-encoding; s=selector1;
 bh=9AaHR1Vuc8xZnWW7XEy+T/9fthfQRDMhX0tFRwdyX6w=;
 b=JF4fRFQudoFEXYllnSibSOB9v4rTRjYi08e9Chk/OxFj4aIZriNQnX5YHmWjjivCAVU9
 7Bb6GWL/GvGEkLQ44JiwpgxWeBu3r487EfGtY2PaAlgf9QBOybjMuoYHD+nPrx+ctzkA
 eruA+P1NaKq/z5Zh/Kun/8nX87eFNZUX6z4Wze07tvKF6d4NYG96gEPUpduYqmk0rlib
 /pm5WvGaqnVACWN+6bgAvpzffigMuLZO3kda8c5yfgk3g4zsB033GY+QqUN9vwTLr61r
 vHACW3D3y5boraIKaGiUNjCVx1GhBFy077/dWeiHQQ7Vd4Sb+0B85FU/ssh7CPhNmgah LQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jergb6y1w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Sep 2022 10:03:39 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 83A1F100034;
 Thu,  8 Sep 2022 10:03:38 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 656212194C2;
 Thu,  8 Sep 2022 10:03:38 +0200 (CEST)
Received: from [10.48.0.213] (10.75.127.120) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Thu, 8 Sep
 2022 10:03:35 +0200
Message-ID: <80f5c40e-4915-2291-cb70-130c1fbe050b@foss.st.com>
Date: Thu, 8 Sep 2022 10:03:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: U-Boot Mailing List <u-boot@lists.denx.de>, Tom Rini <trini@konsulko.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
X-Originating-IP: [10.75.127.120]
X-ClientProxiedBy: GPXDAG2NODE4.st.com (10.75.127.68) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-08_06,2022-09-07_02,2022-06-22_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Marek Vasut <marex@denx.de>, Johann Neuhauser <jneuhauser@dh-electronics.com>
Subject: [Uboot-stm32] [PULL] Pull request for u-boot master / v2022.10 =
 u-boot-stm32-20220907
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

SGkgVG9tLAoKUGxlYXNlIHB1bGwgdGhlIFNUTTMyIHJlbGF0ZWQgZml4ZXMgZm9yIHUtYm9vdC9t
YXN0ZXIsIHYyMDIyLjEwOiAKdS1ib290LXN0bTMyLTIwMjIwOTA3CgotIHNpbXBsaWZ5IHRoZSBT
VE0zMk1QMTV4IHBhY2thZ2UgcGFyc2luZyBjb2RlCi0gcmVtb3ZlIHRlc3Qgb24gQ09ORklHX0RN
X1JFR1VMQVRPUiBpbiBzdG0zMm1wMSBib2FyZAogwqAgYW5kIGVuYWJsZSBDT05GSUdfRE1fUkVH
VUxBVE9SIGZvciBzdG0zMmY3NjktZGlzY28KLSBoYW5kbGUgY2tfdXNib180OG0gY2xvY2sgcHJv
dmlkZWQgYnkgVVNCUEhZQyB0byBmaXggdGhlIGNvbW1hbmQgJ3VzYiAKc3RhcnQnCiDCoCBhZnRl
ciBhbGlnbm1lbnQgd2l0aCBMaW51eCBrZXJuZWwgdjUuMTkgRFQgKGNsb2NrcyA9IDwmdXNicGh5
Yz4pCi0gRml4IFNZU19IWl9DTE9DSyB2YWx1ZSBmb3Igc3RpaDQxMC1iMjI2MCBib2FyZAotIFN3
aXRjaCBTVE1NMzJNUDE1eCBESFNPTSB0byBGTUMyIEVCSSBkcml2ZXIKLSBSZW1vdmUgaHdsb2Nr
cyBmcm9tIHBpbmN0cmwgaW4gU1RNMzJNUDE1eCB0byBhdm9pZCBpc3N1ZSB3aXRoIGtlcm5lbAoK
Q0kgc3RhdHVzOiAKaHR0cHM6Ly9zb3VyY2UuZGVueC5kZS91LWJvb3QvY3VzdG9kaWFucy91LWJv
b3Qtc3RtLy0vcGlwZWxpbmVzLzEzMzgzCgpUaGFua3MsClBhdHJpY2sKCmdpdCByZXF1ZXN0LXB1
bGwgb3JpZ2luL21hc3RlciAKaHR0cHM6Ly9zb3VyY2UuZGVueC5kZS91LWJvb3QvY3VzdG9kaWFu
cy91LWJvb3Qtc3RtLmdpdC8gCnUtYm9vdC1zdG0zMi0yMDIyMDkwNwoKClRoZSBmb2xsb3dpbmcg
Y2hhbmdlcyBzaW5jZSBjb21taXQgNTE2MDEzOTdmY2JiMTNlNmRjMmU0MjIzNDA4MjMwYzgyOTU1
YTYwMToKCiDCoCBQcmVwYXJlIHYyMDIyLjEwLXJjNCAoMjAyMi0wOS0wNSAyMDozMjo1NiAtMDQw
MCkKCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0OgoKIMKgIGh0dHBzOi8v
c291cmNlLmRlbnguZGUvdS1ib290L2N1c3RvZGlhbnMvdS1ib290LXN0bS5naXQvIAp0YWdzL3Ut
Ym9vdC1zdG0zMi0yMDIyMDkwNwoKZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIGQ2ZmYz
YzlmMDRmNzQ0MzQ1ZmU3N2EzZDgyYzViNWUwYzA3YzQ1NmE6CgogwqAgQVJNOiBkdHM6IHN0bTMy
bXAxNTogcmVtb3ZlIGh3bG9ja3MgZnJvbSBwaW5jdHJsICgyMDIyLTA5LTA2IDE1OjQwOjE0IAor
MDIwMCkKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0KLSBzaW1wbGlmeSB0aGUgU1RNMzJNUDE1eCBwYWNrYWdlIHBhcnNpbmcg
Y29kZQotIHJlbW92ZSB0ZXN0IG9uIENPTkZJR19ETV9SRUdVTEFUT1IgaW4gc3RtMzJtcDEgYm9h
cmQKIMKgIGFuZCBlbmFibGUgQ09ORklHX0RNX1JFR1VMQVRPUiBmb3Igc3RtMzJmNzY5LWRpc2Nv
Ci0gaGFuZGxlIGNrX3VzYm9fNDhtIGNsb2NrIHByb3ZpZGVkIGJ5IFVTQlBIWUMgdG8gZml4IHRo
ZSBjb21tYW5kICd1c2IgCnN0YXJ0JwogwqAgYWZ0ZXIgYWxpZ25tZW50IHdpdGggTGludXgga2Vy
bmVsIHY1LjE5IERUIChjbG9ja3MgPSA8JnVzYnBoeWM+KQotIEZpeCBTWVNfSFpfQ0xPQ0sgdmFs
dWUgZm9yIHN0aWg0MTAtYjIyNjAgYm9hcmQKLSBTd2l0Y2ggU1RNTTMyTVAxNXggREhTT00gdG8g
Rk1DMiBFQkkgZHJpdmVyCi0gUmVtb3ZlIGh3bG9ja3MgZnJvbSBwaW5jdHJsIGluIFNUTTMyTVAx
NXggdG8gYXZvaWQgaXNzdWUgd2l0aCBrZXJuZWwKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KRXRpZW5uZSBDYXJyaWVyZSAo
MSk6CiDCoMKgwqDCoMKgIEFSTTogZHRzOiBzdG0zMm1wMTU6IHJlbW92ZSBod2xvY2tzIGZyb20g
cGluY3RybAoKTWFyZWsgVmFzdXQgKDEpOgogwqDCoMKgwqDCoCBBUk06IHN0bTMyOiBTd2l0Y2gg
REhTT00gdG8gRk1DMiBFQkkgZHJpdmVyCgpQYXRyaWNlIENob3RhcmQgKDMpOgogwqDCoMKgwqDC
oCBBUk06IGR0czogc3RtMzI6IEZpeCBkaXNwbGF5LXRpbWluZ3Mgc2V0dGluZ3MgZm9yIHN0bTMy
Zjc0Ni1kaXNjbwogwqDCoMKgwqDCoCBjb25maWdzOiBzdG0zMjogRW5hYmxlIENPTkZJR19ETV9S
RUdVTEFUT1IgZm9yIHN0bTMyZjc2OS1kaXNjbwogwqDCoMKgwqDCoCBjb25maWdzOiBzdGloNDEw
LWIyMjYwOiBGaXggU1lTX0haX0NMT0NLIHZhbHVlCgpQYXRyaWNrIERlbGF1bmF5ICg1KToKIMKg
wqDCoMKgwqAgc3RtMzJtcDogc2ltcGxpZnkgdGhlIFNUTTMyTVAxNXggcGFja2FnZSBwYXJzaW5n
IGNvZGUKIMKgwqDCoMKgwqAgYm9hcmQ6IHN0bTMybXAxOiByZW1vdmUgdGVzdCBvbiBDT05GSUdf
RE1fUkVHVUxBVE9SCiDCoMKgwqDCoMKgIHBoeTogc3RtMzItdXNicGh5YzogYWRkIGNvdW50ZXIg
b2YgUExMIGNvbnN1bWVyCiDCoMKgwqDCoMKgIHBoeTogc3RtMzItdXNicGh5YzogdXNicGh5YyBp
cyBhIGNsb2NrIHByb3ZpZGVyIG9mIGNrX3VzYm9fNDhtIGNsb2NrCiDCoMKgwqDCoMKgIGNsazog
c3RtMzJtcDogaGFuZGxlIGNrX3VzYm9fNDhtIGNsb2NrIHByb3ZpZGVkIGJ5IFVTQlBIWUMKCiDC
oGFyY2gvYXJtL2R0cy9zdG0zMmY3NDYtZGlzY28tdS1ib290LmR0c2nCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHzCoMKgIDIgKy0KIMKgYXJjaC9hcm0vZHRzL3N0bTMybXAxNTEuZHRzacKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAg
MiAtLQogwqBhcmNoL2FybS9kdHMvc3RtMzJtcDE1eHgtZGhjb20tcGljb2l0eC11LWJvb3QuZHRz
acKgwqDCoMKgIHzCoMKgIDggLS0tLS0KIMKgYXJjaC9hcm0vZHRzL3N0bTMybXAxNXh4LWRoY29t
LXUtYm9vdC5kdHNpwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAxNCAtLS0tLS0tLS0KIMKg
YXJjaC9hcm0vZHRzL3N0bTMybXAxNXh4LWRoY29yLWRyYy1jb21wYWN0LXUtYm9vdC5kdHNpIHzC
oCAxNiAtLS0tLS0tLS0tCiDCoGFyY2gvYXJtL21hY2gtc3RtMzJtcC9zdG0zMm1wMTV4LmPCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAxNSArKy0tLS0tLS0tCiDC
oGJvYXJkL2RoZWxlY3Ryb25pY3MvZGhfc3RtMzJtcDEvYm9hcmQuY8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCB8wqAgNTIgCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiDC
oGJvYXJkL3N0L3N0bTMybXAxL3N0bTMybXAxLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDggKystLS0KIMKgY29uZmlncy9zdG0zMmY3
NjktZGlzY29fZGVmY29uZmlnwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHzCoMKgIDEgKwogwqBjb25maWdzL3N0bTMyZjc2OS1kaXNjb19zcGxfZGVmY29uZmlnwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCAxICsKIMKgY29uZmlncy9zdG0z
Mm1wMTVfZGhjb21fYmFzaWNfZGVmY29uZmlnwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHzCoMKgIDEgKwogwqBjb25maWdzL3N0bTMybXAxNV9kaGNvcl9iYXNpY19kZWZjb25maWfCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgMSArCiDCoGRyaXZlcnMvY2xrL3N0bTMy
L2Nsay1zdG0zMm1wMS5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgfMKgIDM1IAorKysrKysrKysrKystLS0tLS0tLS0tCiDCoGRyaXZlcnMvcGh5L3BoeS1zdG0z
Mi11c2JwaHljLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHwgMTU1IAorKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tCiDCoGluY2x1ZGUv
Y29uZmlncy9zdGloNDEwLWIyMjYwLmjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHzCoMKgIDIgKy0KIMKgMTUgZmlsZXMgY2hhbmdlZCwgMTU4IGluc2VydGlv
bnMoKyksIDE1NSBkZWxldGlvbnMoLSkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClVib290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==
