Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 51AFA8AAE47
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Apr 2024 14:17:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1C58EC6DD72;
	Fri, 19 Apr 2024 12:17:04 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A91FEC69066
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Apr 2024 12:17:02 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 43J7svtN019688; Fri, 19 Apr 2024 14:16:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=21KzfnT0nHvkJ6GaDehhAMlM0GB+gOGj37cixEivcC8=; b=b7
 Cnwx4id7J6jUDR+VWKk1DhuWPdTQT3PPH6PNdyumNp8m54SjKPr4O0CS7A/L4Qzl
 HlHAOVUwZR62Zvp8zKdYwsGQPDP1A5w2S51PkJSZJu7RidAhmesFy+axBFpvgeOH
 zAyMqnUBqQJyBL75IAqt2aAYi0zBc11rDWZadwfh/9frTCS1Ftl+DVZgWBgY1vSK
 e4BHhybFMAO0eq7PfctFx0FQbfysszznAhTERNuTn8a+EUPkJf/n9FyanCfufPjB
 h47XyrdBD1i8SAj1rkLiMdoI4aeRs53lwoKiqngp8c5Yl9jksncV63nPa9/4UYna
 f3kj0WhVX7fm7Zr6tWzw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xg50j9e4j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Apr 2024 14:16:55 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id AB2A94002D;
 Fri, 19 Apr 2024 14:16:46 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C07C421861A;
 Fri, 19 Apr 2024 14:16:24 +0200 (CEST)
Received: from [10.252.13.94] (10.252.13.94) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 19 Apr
 2024 14:16:24 +0200
Message-ID: <0baafe54-5626-4005-ac76-933839dab6a9@foss.st.com>
Date: Fri, 19 Apr 2024 14:16:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20240409150215.2497778-1-patrice.chotard@foss.st.com>
 <20240409150215.2497778-3-patrice.chotard@foss.st.com>
 <ab4ee155-7826-4502-8389-5f5a9369b320@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <ab4ee155-7826-4502-8389-5f5a9369b320@foss.st.com>
X-Originating-IP: [10.252.13.94]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-19_08,2024-04-19_01,2023-05-22_02
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH v1 02/25] configs: stm32mp1: Enable
 BUTTON_GPIO flag for stm32mp15_defconfig
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

CgpPbiA0LzE3LzI0IDExOjAzLCBQYXRyaWNrIERFTEFVTkFZIHdyb3RlOgo+IEhpLAo+IAo+IE9u
IDQvOS8yNCAxNzowMSwgUGF0cmljZSBDaG90YXJkIHdyb3RlOgo+PiBFbmFibGUgQlVUVE9OX0dQ
SU8gZmxhZyBmb3IgU1RNMzJNUDE1Lgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBQYXRyaWNlIENob3Rh
cmQgPHBhdHJpY2UuY2hvdGFyZEBmb3NzLnN0LmNvbT4KPj4gLS0tCj4+Cj4+IMKgIGNvbmZpZ3Mv
c3RtMzJtcDE1X2RlZmNvbmZpZyB8IDIgKysKPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvY29uZmlncy9zdG0zMm1wMTVfZGVmY29uZmlnIGIv
Y29uZmlncy9zdG0zMm1wMTVfZGVmY29uZmlnCj4+IGluZGV4IDMzMDJiMzA2OTk2Li5mZmU3NTEy
NjUwZSAxMDA2NDQKPj4gLS0tIGEvY29uZmlncy9zdG0zMm1wMTVfZGVmY29uZmlnCj4+ICsrKyBi
L2NvbmZpZ3Mvc3RtMzJtcDE1X2RlZmNvbmZpZwo+PiBAQCAtNjksNiArNjksOCBAQCBDT05GSUdf
VEZUUF9UU0laRT15Cj4+IMKgIENPTkZJR19VU0VfU0VSVkVSSVA9eQo+PiDCoCBDT05GSUdfU0VS
VkVSSVA9IjE5Mi4xNjguMS4xIgo+PiDCoCBDT05GSUdfU1RNMzJfQURDPXkKPj4gK0NPTkZJR19C
VVRUT049eQo+PiArQ09ORklHX0JVVFRPTl9HUElPPXkKPj4gwqAgQ09ORklHX0NMS19TQ01JPXkK
Pj4gwqAgQ09ORklHX1NFVF9ERlVfQUxUX0lORk89eQo+PiDCoCBDT05GSUdfVVNCX0ZVTkNUSU9O
X0ZBU1RCT09UPXkKPiAKPiAKPiAKPiBSZXZpZXdlZC1ieTogUGF0cmljayBEZWxhdW5heSA8cGF0
cmljay5kZWxhdW5heUBmb3NzLnN0LmNvbT4KPiAKPiBUaGFua3MKPiBQYXRyaWNrCj4gCkFwcGxp
ZWQgb24gdS1ib290LXN0bTMyL21hc3RlciAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
