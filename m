Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4A25B0537
	for <lists+uboot-stm32@lfdr.de>; Wed,  7 Sep 2022 15:35:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D8F24C63325;
	Wed,  7 Sep 2022 13:35:51 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 54C75C63324
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Sep 2022 13:35:50 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2879DNww018634;
 Wed, 7 Sep 2022 15:35:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=vRHpb1OO/mkb850KjF1k6VFVfF4l+5n7WgOykwQ0QhA=;
 b=FCkX4FwrislZY+DcJLhT3IY7gylc2gT7fmjZ1KTIjrSE6cRAOsiyGPM9oNO/aUpeXPTa
 +5gwAomx1CIUvcH9iGpld5zDjNT48gS4wL56enRSpVhTeXYpwmvnClCCfgxY8jGaCQFl
 OEghkZb9VGAYYiRdg+LkjmJGFAn89ygPNn8T6uT0AobCeeDGJ3Cvu0dtUoAYRMWnTMMJ
 0Oj+VbRJ4AnMYy1NN9poMWe8cnySrh9fHs0oxiuhqMkIRVjnwlEGx6PKNo/wyMVzL/rO
 umJTSRyUlt1tLrqXAAtlqktwZs4UzONpF74UiN8R2zb2Arb5isw/nM2a+1I7RfMxuD8D +g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jerfv1kn6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Sep 2022 15:35:49 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6E3E710002A;
 Wed,  7 Sep 2022 15:35:47 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D96EC22A6EF;
 Wed,  7 Sep 2022 15:35:47 +0200 (CEST)
Received: from [10.48.0.213] (10.75.127.123) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Wed, 7 Sep
 2022 15:35:46 +0200
Message-ID: <934f571f-efbc-d093-d1bd-3bb50d13df94@foss.st.com>
Date: Wed, 7 Sep 2022 15:35:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Etienne Carriere <etienne.carriere@linaro.org>, <u-boot@lists.denx.de>
References: <20220905091528.579610-1-etienne.carriere@linaro.org>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20220905091528.579610-1-etienne.carriere@linaro.org>
X-Originating-IP: [10.75.127.123]
X-ClientProxiedBy: GPXDAG2NODE4.st.com (10.75.127.68) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-07_08,2022-09-07_01,2022-06-22_01
Cc: uboot-stm32@st-md-mailman.stormreply.com
Subject: Re: [Uboot-stm32] [PATCH] ARM: dts: stm32mp15: remove hwlocks from
	pinctrl
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

SGksCgpPbiA5LzUvMjIgMTE6MTUsIEV0aWVubmUgQ2FycmllcmUgd3JvdGU6Cj4gUmVtb3ZlcyBo
d2xvY2tzIHByb3BlcnRpZXMgZnJvbSBzdG0zMm1wMTUxIHBpbmN0cmwgbm9kZS4gVGhlc2UgbG9j
a3MKPiBjb3VsZCBiZSB1c2VkIGZvciBvdGhlciBwdXJwb3NlLCBkZXBlbmRpbmcgb24gYm9hcmQg
YW5kIHNvZnR3YXJlCj4gY29uZmlndXJhdGlvbiBoZW5jZSBkbyBub3QgZW5mb3JjZSB0aGVpciB1
c2UgdG8gcHJvdGVjdCBwaW5jdHJsCj4gZGV2aWNlcy4KPgo+IFRoaXMgcGF0Y2ggaXMgYW4gYWxp
Z25tZW50IHdpdGggTGludXggZGV2aWNlIHRyZWUgd2l0aCB2Ni4wIGFzIHRoZQo+IGh3c2VtIHN1
cHBvcnQgd2FzbuKAmXQgeWV0IGFkZGVkIGluIHBpbmNvbnRyb2wgaW4ga2VybmVsLiBJdCBhdm9p
ZHMKPiBpc3N1ZXMgd2hlbiB0aGUgTGludXgga2VybmVsIGlzIHN0YXJ0ZWQgd2l0aCB0aGUgVS1C
b290IGRldmljZSB0cmVlLgo+Cj4gQ2M6IFBhdHJpY2UgQ2hvdGFyZCA8cGF0cmljZS5jaG90YXJk
QGZvc3Muc3QuY29tPgo+IENjOiBQYXRyaWNrIERlbGF1bmF5IDxwYXRyaWNrLmRlbGF1bmF5QGZv
c3Muc3QuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEV0aWVubmUgQ2FycmllcmUgPGV0aWVubmUuY2Fy
cmllcmVAbGluYXJvLm9yZz4KPiAtLS0KPiAgIGFyY2gvYXJtL2R0cy9zdG0zMm1wMTUxLmR0c2kg
fCAyIC0tCj4gICAxIGZpbGUgY2hhbmdlZCwgMiBkZWxldGlvbnMoLSkKPgoKQXBwbGllZCB0byB1
LWJvb3Qtc3RtL21hc3RlciwgdGhhbmtzIQoKClJlZ2FyZHMKUGF0cmljawoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClVib290LXN0bTMyIG1haWxpbmcg
bGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==
