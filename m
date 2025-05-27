Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AE921AC4DE1
	for <lists+uboot-stm32@lfdr.de>; Tue, 27 May 2025 13:50:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 55B03C36B19;
	Tue, 27 May 2025 11:50:35 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6B8F3C36B18
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 May 2025 11:50:34 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RA60ir027752;
 Tue, 27 May 2025 13:49:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 sZXe1hRznVvomhT0D0Zh9WpmzwMlyHOTOftd/CMNdsU=; b=mcL5QyFpLgCSKeQq
 dZ9NiNXHscHkDDLQXvp7VS0xrk7uRsBhHz5Z4qjdezg5nXfcYtVgmRdqIjM3AyCF
 fcrfVgOUNjE8XmSeW9n+rkZki6Pm7YlygeBKYii9ZQEtbTR2ooHowDuaqlOFUD5f
 zc5B4DnnHwpQ/A1OIwJPmcMTbI57Q+1I/pWsVOvVLTqRB3XwDlx8QDB8NyqfWK89
 w89seGbcwH+eCNu08mvV/rBQr/7eVZN7kg+iP9mUR8ExJfjoGGgoUY3cZExbWz28
 D5tbkh9HUU2Sd+8a8US9owMfLTIJ9AEz7Rjp4n9c8yk/XWiEmrKYUhOjVn6UDDvI
 iDqVlg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46uqp4hnj9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 May 2025 13:49:40 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id BD46D40046;
 Tue, 27 May 2025 13:47:23 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F35C1A473E5;
 Tue, 27 May 2025 13:45:59 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 27 May
 2025 13:45:58 +0200
Message-ID: <60be33dc-0833-45c9-adad-b7e2fe7b3eaf@foss.st.com>
Date: Tue, 27 May 2025 13:45:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Gabriel FERNANDEZ <gabriel.fernandez@foss.st.com>, <u-boot@lists.denx.de>
References: <20250521134117.2828335-1-patrice.chotard@foss.st.com>
 <20250521134117.2828335-12-patrice.chotard@foss.st.com>
 <ad156150-a116-4b85-92a5-9764a53166bc@foss.st.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <ad156150-a116-4b85-92a5-9764a53166bc@foss.st.com>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_06,2025-05-27_01,2025-03-28_01
Cc: Mattijs Korpershoek <mkorpershoek@kernel.org>,
 Kever Yang <kever.yang@rock-chips.com>,
 Finley Xiao <finley.xiao@rock-chips.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Nathan Barrett-Morrison <nathan.morrison@timesys.com>,
 Christian Marangi <ansuelsmth@gmail.com>, Joseph Chen <chenjh@rock-chips.com>,
 Jerome Forissier <jerome.forissier@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, Oliver Gaskell <Oliver.Gaskell@analog.com>,
 Huan Zhou <me@per1cycle.org>, Elaine Zhang <zhangqing@rock-chips.com>,
 Sumit Garg <sumit.garg@kernel.org>, Igor Opaniuk <igor.opaniuk@gmail.com>,
 Robert Marko <robert.marko@sartura.hr>,
 Sam Protsenko <semen.protsenko@linaro.org>,
 Leo Yu-Chi Liang <ycliang@andestech.com>, Greg Malysa <malysagreg@gmail.com>,
 Simon Glass <sjg@chromium.org>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Paul Barker <paul.barker.ct@bp.renesas.com>
Subject: Re: [Uboot-stm32] [PATCH v1 11/13] reset: stm32mp25: add stm32mp25
	reset driver
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

CgpPbiA1LzIyLzI1IDA5OjEwLCBHYWJyaWVsIEZFUk5BTkRFWiB3cm90ZToKPiAKPiBPbiA1LzIx
LzI1IDE1OjQxLCBQYXRyaWNlIENob3RhcmQgd3JvdGU6Cj4+IEZyb206IEdhYnJpZWwgRmVybmFu
ZGV6IDxnYWJyaWVsLmZlcm5hbmRlekBmb3NzLnN0LmNvbT4KPj4KPj4gSW1wbGVtZW50IFNUTTMy
TVAyNSByZXNldCBkcml2ZXJzIHVzaW5nIHN0bTMyLWNvcmUtcmVzZXQgQVBJLgo+PiBUaGlzIHJl
c2V0IHN0bTMyLXJlc2V0LWNvcmUgQVBJIGFuZCB3aWxsIGJlIGFibGUgdG8gdXNlIERUIGJpbmRp
bmcKPj4gaW5kZXggc3RhcnRlZCBmcm9tIDAuCj4+Cj4+IFRoaXMgcGF0Y2ggYWxzbyBtb3ZlcyBs
ZWdhY3kgcmVzZXQgaW50byBzdG0zMiBkaXJlY3RvcnkgcmVzZXQuCj4+Cj4+IFNpZ25lZC1vZmYt
Ynk6IEdhYnJpZWwgRmVybmFuZGV6IDxnYWJyaWVsLmZlcm5hbmRlekBmb3NzLnN0LmNvbT4KPj4g
U2lnbmVkLW9mZi1ieTogUGF0cmljZSBDaG90YXJkIDxwYXRyaWNlLmNob3RhcmRAZm9zcy5zdC5j
b20+Cj4+IC0tLQo+PgoKWy4uLl0KCj4+ICvCoMKgwqAgUkVTRVQoQURDMTJfUizCoMKgwqDCoMKg
wqDCoCBSQ0NfQURDMTJDRkdSLMKgwqDCoMKgwqDCoMKgIDAswqDCoMKgIDApLAo+PiArwqDCoMKg
IFJFU0VUKEFEQzNfUizCoMKgwqDCoMKgwqDCoCBSQ0NfQURDM0NGR1IswqDCoMKgwqDCoMKgwqAg
MCzCoMKgwqAgMCksCj4+ICvCoMKgwqAgUkVTRVQoRVRIMV9SLMKgwqDCoMKgwqDCoMKgIFJDQ19F
VEgxQ0ZHUizCoMKgwqDCoMKgwqDCoCAwLMKgwqDCoCAwKSwKPj4gK8KgwqDCoCBSRVNFVChFVEgy
X1IswqDCoMKgwqDCoMKgwqAgUkNDX0VUSDJDRkdSLMKgwqDCoMKgwqDCoMKgIDAswqDCoMKgIDAp
LAo+PiArwqDCoMKgIFJFU0VUKFVTQkhfUizCoMKgwqDCoMKgwqDCoCBSQ0NfVVNCMkNGR1IswqDC
oMKgwqDCoMKgwqAgMCzCoMKgwqAgMCksCj4gCj4gUkNDX1VTQkhDRkdSCgpPawoKPiAKPiBCZXN0
IHJlZ2FyZHMKPiAKPiBHYWJyaWVsCj4gCj4+ICvCoMKgwqAgUkVTRVQoVVNCMlBIWTFfUizCoMKg
wqAgUkNDX1VTQjJQSFkxQ0ZHUizCoMKgwqAgMCzCoMKgwqAgMCksCj4+ICvCoMKgwqAgUkVTRVQo
VVNCMlBIWTJfUizCoMKgwqAgUkNDX1VTQjJQSFkyQ0ZHUizCoMKgwqAgMCzCoMKgwqAgMCksCj4+
ICvCoMKgwqAgUkVTRVQoVVNCM0RSX1IswqDCoMKgwqDCoMKgwqAgUkNDX1VTQjNEUkNGR1IswqDC
oMKgwqDCoMKgwqAgMCzCoMKgwqAgMCksCj4+ICvCoMKgwqAgUkVTRVQoVVNCM1BDSUVQSFlfUizC
oMKgwqAgUkNDX1VTQjNQQ0lFUEhZQ0ZHUizCoMKgwqAgMCzCoMKgwqAgMCksCj4+ICvCoMKgwqAg
UkVTRVQoVVNCVENfUizCoMKgwqDCoMKgwqDCoCBSQ0NfVUNQRENGR1IswqDCoMKgwqDCoMKgwqAg
MCzCoMKgwqAgMCksCj4+ICvCoMKgwqAgUkVTRVQoRVRIU1dfUizCoMKgwqDCoMKgwqDCoCBSQ0Nf
RVRIU1dDRkdSLMKgwqDCoMKgwqDCoMKgIDAswqDCoMKgIDApLAo+PiArwqDCoMKgIFJFU0VUKFNE
TU1DMV9SLMKgwqDCoMKgwqDCoMKgIFJDQ19TRE1NQzFDRkdSLMKgwqDCoMKgwqDCoMKgIDAswqDC
oMKgIDApLAo+PiArwqDCoMKgIFJFU0VUKFNETU1DMURMTF9SLMKgwqDCoCBSQ0NfU0RNTUMxQ0ZH
UizCoMKgwqDCoMKgwqDCoCAxNizCoMKgwqAgMCksCj4+ICvCoMKgwqAgUkVTRVQoU0RNTUMyX1Is
wqDCoMKgwqDCoMKgwqAgUkNDX1NETU1DMkNGR1IswqDCoMKgwqDCoMKgwqAgMCzCoMKgwqAgMCks
Cj4+ICvCoMKgwqAgUkVTRVQoU0RNTUMyRExMX1IswqDCoMKgIFJDQ19TRE1NQzJDRkdSLMKgwqDC
oMKgwqDCoMKgIDE2LMKgwqDCoCAwKSwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClVib290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==
