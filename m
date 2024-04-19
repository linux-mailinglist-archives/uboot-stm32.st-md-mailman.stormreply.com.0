Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B728AAE49
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Apr 2024 14:17:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2AF46C6DD72;
	Fri, 19 Apr 2024 12:17:12 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 28ECDC69066
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Apr 2024 12:17:11 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 43JAnGLM026843; Fri, 19 Apr 2024 14:17:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=flzRXeFzBTyzHDBcpShRTKRYvht2i71vtAXYSFBRrpg=; b=C5
 pXkIXiNvhQZ5ElH52wltozllImWBslrqMWrT2+IfDwpi5l4mXzNBt0SJhOiV4np8
 pyPycd7IUmX3QeQbgqs6lbgdk+yymmtDRHfZ+EbhxeOkhC9X/I+s3xSeZRbH0ihv
 3db3U/t/7JEwbb+trNzQ1QFUikfyaJKgRTprY06MaE3+mqqIECGeN8oqNY/Vs+Gg
 1E/u90B0yQYEzlyfUS19J3KTUFv9q2v5EyMcaeXS2tW9ONi1h5AAbvj7xTsiO1be
 /GsyvnXIDRX73w3kD7G8QFVshiWj5ySZXpBm5Vz2zBMIMeqQckPVrppy9umv6JAQ
 IZqRdA5MdJUI4N08vAiw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xfhcx44cd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Apr 2024 14:17:06 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id EA82840045;
 Fri, 19 Apr 2024 14:17:01 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 274932194FF;
 Fri, 19 Apr 2024 14:16:32 +0200 (CEST)
Received: from [10.252.13.94] (10.252.13.94) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 19 Apr
 2024 14:16:31 +0200
Message-ID: <6aff48e7-0b7e-4bae-a1fc-3a219350727a@foss.st.com>
Date: Fri, 19 Apr 2024 14:16:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20240409150215.2497778-1-patrice.chotard@foss.st.com>
 <20240409150215.2497778-4-patrice.chotard@foss.st.com>
 <3d9a3897-e454-43f9-a2af-202fd035a36a@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <3d9a3897-e454-43f9-a2af-202fd035a36a@foss.st.com>
X-Originating-IP: [10.252.13.94]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-19_08,2024-04-19_01,2023-05-22_02
Cc: Tom Rini <trini@konsulko.com>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>, Simon Glass <sjg@chromium.org>,
 Sean Anderson <seanga2@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH v1 03/25] configs: stm32mp1: Enable
 BUTTON_GPIO flag for stm32mp15_basic_defconfig
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

CgpPbiA0LzE3LzI0IDExOjA0LCBQYXRyaWNrIERFTEFVTkFZIHdyb3RlOgo+IEhpLAo+IAo+IE9u
IDQvOS8yNCAxNzowMSwgUGF0cmljZSBDaG90YXJkIHdyb3RlOgo+PiBFbmFibGUgQlVUVE9OX0dQ
SU8gZmxhZyBmb3IgU1RNMzJNUDE1Lgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBQYXRyaWNlIENob3Rh
cmQgPHBhdHJpY2UuY2hvdGFyZEBmb3NzLnN0LmNvbT4KPj4gLS0tCj4+Cj4+IMKgIGNvbmZpZ3Mv
c3RtMzJtcDE1X2Jhc2ljX2RlZmNvbmZpZyB8IDIgKysKPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvY29uZmlncy9zdG0zMm1wMTVfYmFzaWNf
ZGVmY29uZmlnIGIvY29uZmlncy9zdG0zMm1wMTVfYmFzaWNfZGVmY29uZmlnCj4+IGluZGV4IDAw
NWYxZDU1ZjgwLi4yZTIyYmY4NjAwMCAxMDA2NDQKPj4gLS0tIGEvY29uZmlncy9zdG0zMm1wMTVf
YmFzaWNfZGVmY29uZmlnCj4+ICsrKyBiL2NvbmZpZ3Mvc3RtMzJtcDE1X2Jhc2ljX2RlZmNvbmZp
Zwo+PiBAQCAtOTcsNiArOTcsOCBAQCBDT05GSUdfVEZUUF9UU0laRT15Cj4+IMKgIENPTkZJR19V
U0VfU0VSVkVSSVA9eQo+PiDCoCBDT05GSUdfU0VSVkVSSVA9IjE5Mi4xNjguMS4xIgo+PiDCoCBD
T05GSUdfU1RNMzJfQURDPXkKPj4gK0NPTkZJR19CVVRUT049eQo+PiArQ09ORklHX0JVVFRPTl9H
UElPPXkKPj4gwqAgQ09ORklHX1NFVF9ERlVfQUxUX0lORk89eQo+PiDCoCBDT05GSUdfVVNCX0ZV
TkNUSU9OX0ZBU1RCT09UPXkKPj4gwqAgQ09ORklHX0ZBU1RCT09UX0JVRl9BRERSPTB4QzAwMDAw
MDAKPiAKPiAKPiAKPiBSZXZpZXdlZC1ieTogUGF0cmljayBEZWxhdW5heSA8cGF0cmljay5kZWxh
dW5heUBmb3NzLnN0LmNvbT4KPiAKPiBUaGFua3MKPiBQYXRyaWNrCj4gCgpBcHBsaWVkIG9uIHUt
Ym9vdC1zdG0zMi9tYXN0ZXIgCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClVib290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9t
YWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==
