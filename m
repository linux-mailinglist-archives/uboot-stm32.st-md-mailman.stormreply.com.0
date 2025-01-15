Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C2BE9A12472
	for <lists+uboot-stm32@lfdr.de>; Wed, 15 Jan 2025 14:09:36 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7B373C78F74;
	Wed, 15 Jan 2025 13:09:36 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 74818C6DD6D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Jan 2025 13:09:29 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50FAcavA014666;
 Wed, 15 Jan 2025 14:09:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 p6l2VJzcvD/YkZ3iEEOu/34LQtXHhFKnIgghrRQhS0s=; b=tvscjRQkSUq74ZG+
 5vtDZ2THjJJXvbqTbJHshiGxXBlXdsgpaBirUW208rdCFyWZ9Uv0AzOEIDIo8fw2
 JWkysb4vLHbrJn9jYc0fXwIhFTsh4K5OXQXABdwXQaAyCpykkKX3vB/QGBZKL3KX
 jm83UvQTAF5QoDBBxmjWjCYbfTrE3W8rCRCpm1bP7GZCtYCByBHBFJbVgE5TVrW8
 kIxO5wf3uGHk2o5SnPgyztQz5ArSMPo7Q0glsL9NnPwjO2fMGl/11Og2ZGi/5aJw
 4uz1axDH6nGz2zhECJL+lEOV0bchulhdHn23V2olXp66vyeeZgwm301CHqZNOGC0
 JekIPw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4466tjswr3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Jan 2025 14:09:21 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 08B854004A;
 Wed, 15 Jan 2025 14:08:17 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 80FC224FBFA;
 Wed, 15 Jan 2025 14:07:44 +0100 (CET)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 15 Jan
 2025 14:07:43 +0100
Message-ID: <cd370701-ffe6-4840-b5d9-63d8aaeb4fc3@foss.st.com>
Date: Wed, 15 Jan 2025 14:07:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marex@denx.de>, <u-boot@lists.denx.de>
References: <20250114144528.1612168-1-patrice.chotard@foss.st.com>
 <20250114144528.1612168-5-patrice.chotard@foss.st.com>
 <366cef60-e32f-4557-9830-b1b642f0683f@denx.de>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <366cef60-e32f-4557-9830-b1b642f0683f@denx.de>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-15_05,2025-01-15_02,2024-11-22_01
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Caleb Connolly <caleb.connolly@linaro.org>, Tom Rini <trini@konsulko.com>,
 Jan Kiszka <jan.kiszka@siemens.com>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH 04/10] usb: dwc3-generic: Add STih407
	support
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

CgpPbiAxLzE0LzI1IDE1OjUzLCBNYXJlayBWYXN1dCB3cm90ZToKPiBPbiAxLzE0LzI1IDM6NDUg
UE0sIFBhdHJpY2UgQ2hvdGFyZCB3cm90ZToKPiAKPj4gK8KgwqDCoCAvKiBnbHVlIGluaXQgKi8K
Pj4gK8KgwqDCoCByZWcgPSByZWFkbChnbHVlX2Jhc2UgKyBDTEtSU1RfQ1RSTCk7Cj4+ICsKPj4g
K8KgwqDCoCByZWcgfD0gQVVYX0NMS19FTiB8IEVYVF9DRkdfUkVTRVRfTiB8IFhIQ0lfUkVWSVNJ
T047Cj4+ICvCoMKgwqAgcmVnICY9IH5TV19QSVBFV19SRVNFVF9OOwo+PiArCj4+ICvCoMKgwqAg
d3JpdGVsKHJlZywgZ2x1ZV9iYXNlICsgQ0xLUlNUX0NUUkwpOwo+PiArCj4+ICvCoMKgwqAgLyog
Y29uZmlndXJlIG11eCBmb3IgdmJ1cywgcG93ZXJwcmVzZW50IGFuZCBidmFsaWQgc2lnbmFscyAq
Lwo+PiArwqDCoMKgIHJlZyA9IHJlYWRsKGdsdWVfYmFzZSArIFVTQjJfVkJVU19NTkdNTlRfU0VM
MSk7Cj4+ICsKPj4gK8KgwqDCoCByZWcgfD0gU0VMX09WRVJSSURFX1ZCVVNWQUxJRChVU0IyX1ZC
VVNfVVRNSU9URykgfAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqAgU0VMX09WRVJSSURFX1BPV0VS
UFJFU0VOVChVU0IyX1ZCVVNfVVRNSU9URykgfAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqAgU0VM
X09WRVJSSURFX0JWQUxJRChVU0IyX1ZCVVNfVVRNSU9URyk7Cj4+ICsKPj4gK8KgwqDCoCB3cml0
ZWwocmVnLCBnbHVlX2Jhc2UgKyBVU0IyX1ZCVVNfTU5HTU5UX1NFTDEpOwo+IHNldGJpdHNfbGUz
MigpICwgcGxlYXNlIGZpeCBnbG9iYWxseS4KCk9rCgo+IAo+IEFsc28sIEkgYW0gd29uZGVyaW5n
IGlmIHdlJ3JlIG5vdCBvdmVyc3R1ZmZpbmcgdGhlIGR3YzMtZ2VuZXJpYy5jIHdpdGggdG9vIG1h
bnkgZGlzcGFyYXRlIGdsdWUgY29kZSBzaHJlZHMsIGFuZCB3aGV0aGVyIGl0IGlzbid0IGp1c3Qg
YWJvdXQgdGltZSB0byBzcGxpdCB0aGUgZ2x1ZSBjb2RlIHBhcnRzIG91dCBvZiBpdCwgaW50byBz
ZXBhcmF0ZSAuYyBmaWxlcy4gVGhvdWdodHMgPwoKT0sgaSB3aWxsIGludHJvZHVjZSBhIHNwZWNp
ZmljIGR3YzMtc3RpLmMgZ2x1ZSB3cmFwcGVyLiBJIGp1c3Qgbm90aWNlIHRoYXQgZHdjMy1hbTYy
LmMgb3IgZHdjMy11bmlwaGllci5jIGFyZSB0eXBpY2FsbHkgd2hhdCBpIGhhdmUgdG8gZG8uCkJ5
IHRoZSBzYW1lIG9jY2FzaW9uLCBpdCByZW1vdmVzIHRoZSBuZWVkIG9mIHBhdGNoIDA2LzEwIHdp
dGggUkVHTUFQL1NZU0NPTiBkZXBlbmRlbmNpZXMKClRoYW5rcwpQYXRyaWNlCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClVib290LXN0bTMyIG1haWxpbmcg
bGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==
