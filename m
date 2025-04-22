Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D7AA961C4
	for <lists+uboot-stm32@lfdr.de>; Tue, 22 Apr 2025 10:33:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A4552C78F68;
	Tue, 22 Apr 2025 08:33:22 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F2068C78F67
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Apr 2025 08:33:20 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53M7dHtq023461;
 Tue, 22 Apr 2025 10:33:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 OcAejmSOkWnSvqdkMRqZ24+MEKOqVzyMJWX6U4FWu/4=; b=Q3msbC76PXeCzr3W
 HwfhrgwHBtxQrZjlw7bLB5oCfM9whCz6udnnpi1e21ZOl4SC3qGL6rlC1tuK8Smi
 MKBn3/MJ0yVcsm1J51X6ffXAI34PQUDAApKV5LNPjDDLIN8I7K9tX5iMMO0jskKP
 sbgAa1CidwdEgwuuJoAj4JSHmFkh+O5EmYTePzbquporJe0apCo5pdgoPdGd9O2j
 pkuY7vT8dndtGs9vKYCt51hOR/O1rv4j0xyGXaPLEOiy6+zmJXzMuzd8ywiH68DD
 sfwPkBwi3JMpE1E6oUT+a1H7ngFES1iNHkhtlb3Y9CTUw9QNOfbKMVawVMHukKAh
 HHtXjA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 464nd3y0u1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Apr 2025 10:33:16 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 3DC0A40057;
 Tue, 22 Apr 2025 10:32:22 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D03DA9D24E3;
 Tue, 22 Apr 2025 10:32:00 +0200 (CEST)
Received: from [10.48.87.126] (10.48.87.126) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 22 Apr
 2025 10:32:00 +0200
Message-ID: <a7491caf-a8a1-427d-a4e3-fe70add98218@foss.st.com>
Date: Tue, 22 Apr 2025 10:31:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>
References: <20250401131413.387139-1-patrice.chotard@foss.st.com>
 <20250401131413.387139-10-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20250401131413.387139-10-patrice.chotard@foss.st.com>
X-Originating-IP: [10.48.87.126]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_04,2025-04-21_02,2024-11-22_01
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Simon Glass <sjg@chromium.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Lionel Debieve <lionel.debieve@foss.st.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH 09/13] ARM: stm32mp: add ETZPC system bus
 driver for STM32MP1
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

SGksCgoKT24gNC8xLzI1IDE1OjE0LCBQYXRyaWNlIENob3RhcmQgd3JvdGU6Cj4gRnJvbTogTGlv
bmVsIERlYmlldmUgPGxpb25lbC5kZWJpZXZlQGZvc3Muc3QuY29tPgo+Cj4gVGhpcyBkcml2ZXIg
aXMgY2hlY2tpbmcgdGhlIGFjY2VzcyByaWdodHMgb2YgdGhlIGRpZmZlcmVudAo+IHBlcmlwaGVy
YWxzIGNvbm5lY3RlZCB0byB0aGUgRVRaUEMgYnVzLiBJZiBhY2Nlc3MgaXMgZGVuaWVkLAo+IHRo
ZSBhc3NvY2lhdGVkIGRldmljZSBpcyBub3QgYm91bmQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBMaW9u
ZWwgRGViaWV2ZSA8bGlvbmVsLmRlYmlldmVAZm9zcy5zdC5jb20+Cj4gU2lnbmVkLW9mZi1ieTog
R2F0aWVuIENoZXZhbGxpZXIgPGdhdGllbi5jaGV2YWxsaWVyQGZvc3Muc3QuY29tPgo+IFNpZ25l
ZC1vZmYtYnk6IFBhdHJpY2sgRGVsYXVuYXkgPHBhdHJpY2suZGVsYXVuYXlAZm9zcy5zdC5jb20+
Cj4gU2lnbmVkLW9mZi1ieTogUGF0cmljZSBDaG90YXJkIDxwYXRyaWNlLmNob3RhcmRAZm9zcy5z
dC5jb20+Cj4gLS0tCj4KPiAgIGFyY2gvYXJtL21hY2gtc3RtMzJtcC9pbmNsdWRlL21hY2gvZXR6
cGMuaCB8ICAzMiArKysrCj4gICBhcmNoL2FybS9tYWNoLXN0bTMybXAvc3RtMzJtcDEvTWFrZWZp
bGUgICAgfCAgIDEgKwo+ICAgYXJjaC9hcm0vbWFjaC1zdG0zMm1wL3N0bTMybXAxL2V0enBjLmMg
ICAgIHwgMTk0ICsrKysrKysrKysrKysrKysrKysrKwo+ICAgMyBmaWxlcyBjaGFuZ2VkLCAyMjcg
aW5zZXJ0aW9ucygrKQo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJtL21hY2gtc3RtMzJt
cC9pbmNsdWRlL21hY2gvZXR6cGMuaAo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJtL21h
Y2gtc3RtMzJtcC9zdG0zMm1wMS9ldHpwYy5jCj4KLi4uCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJt
L21hY2gtc3RtMzJtcC9zdG0zMm1wMS9ldHpwYy5jIGIvYXJjaC9hcm0vbWFjaC1zdG0zMm1wL3N0
bTMybXAxL2V0enBjLmMKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAw
Li5iN2FlZmI4NDA2OQo+IC0tLSAvZGV2L251bGwKPiArKysgYi9hcmNoL2FybS9tYWNoLXN0bTMy
bXAvc3RtMzJtcDEvZXR6cGMuYwo+IEBAIC0wLDAgKzEsMTk0IEBACj4gKy8vIFNQRFgtTGljZW5z
ZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9yLWxhdGVyIE9SIEJTRC0zLUNsYXVzZQo+ICsvKgo+ICsg
KiBDb3B5cmlnaHQgKEMpIDIwMjMsIFNUTWljcm9lbGVjdHJvbmljcyAtIEFsbCBSaWdodHMgUmVz
ZXJ2ZWQKPiArICovCj4gKwo+ICsjZGVmaW5lIExPR19DQVRFR09SWSBVQ0xBU1NfU0lNUExFX0JV
UwoKCm1pbm9ywqAgPT4gd2h5IFNJTVBMRV9CVVMgaGVyZSA/CgoKI2RlZmluZSBMT0dfQ0FURUdP
UlkgVUNMQVNTX05PUAoKCj4gKwo+ICsjaW5jbHVkZSA8ZG0uaD4KPiArI2luY2x1ZGUgPGFzbS9p
by5oPgo+ICsjaW5jbHVkZSA8ZG0vZGV2aWNlLmg+Cj4gKyNpbmNsdWRlIDxkbS9kZXZpY2VfY29t
cGF0Lmg+Cj4gKyNpbmNsdWRlIDxkbS9saXN0cy5oPgo+ICsjaW5jbHVkZSA8bGludXgvYml0Zmll
bGQuaD4KPiArI2luY2x1ZGUgPG1hY2gvZXR6cGMuaD4KPiArCi4uLgo+ICsKPiArVV9CT09UX0RS
SVZFUihzdG0zMl9ldHpwYykgPSB7Cj4gKwkubmFtZSA9ICJzdG0zMl9ldHpwYyIsCj4gKwkuaWQg
PSBVQ0xBU1NfTk9QLAo+ICsJLm9mX21hdGNoID0gc3RtMzJfZXR6cGNfaWRzLAo+ICsJLmJpbmQg
PSBzdG0zMl9ldHpwY19iaW5kLAo+ICsJLnBsYXRfYXV0byA9IHNpemVvZihzdHJ1Y3Qgc3RtMzJf
ZXR6cGNfcGxhdCksCj4gK307CgoKClJldmlld2VkLWJ5OiBQYXRyaWNrIERlbGF1bmF5IDxwYXRy
aWNrLmRlbGF1bmF5QGZvc3Muc3QuY29tPgoKVGhhbmtzClBhdHJpY2sKCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBs
aXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
