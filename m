Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 47445667942
	for <lists+uboot-stm32@lfdr.de>; Thu, 12 Jan 2023 16:29:59 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EA9B1C69049;
	Thu, 12 Jan 2023 15:29:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 50539C69048
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Jan 2023 15:29:57 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30CCs6Ij006832; Thu, 12 Jan 2023 16:29:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=vIGMAnvW5gSbWlxWkd9fF1LDgPSLG+ajVmnUuOyscBc=;
 b=vlKI0H6YDsgPVQVloexENOZsnDRsmEKr4NZHB7biL2lu/cnwBuqt3uoKeNCiAU8KxMdf
 rf5g63HmkEuuFcmDTokKfzQGDD5jjcSmWkd4uB8v061WtgHJNH2/xWv6y4nWtNK+RoL7
 ScQZuwH6CIsKkcpQu7/JprgBBdM56+zKTMKdpleV3WaYKL+RrlOjccLBeCAe5LtqLGwm
 /9X8+NMiL9oYOC3axJaQlf+aULSS57hZu2SKNzleVhcunueQ/IwmXIuuOvcN7KLuF0Vu
 mq8+rbKXWMyKVSLqw0wg0Af5DBjJyZXNySJHW+FFKeBn90h3eK5FnM4q/BmgMb/oAUOL Ng== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3n1tnmgwqt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Jan 2023 16:29:56 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0144B10002A;
 Thu, 12 Jan 2023 16:29:56 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EFD9721B528;
 Thu, 12 Jan 2023 16:29:55 +0100 (CET)
Received: from [10.201.21.26] (10.201.21.26) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Thu, 12 Jan
 2023 16:29:55 +0100
Message-ID: <526d872f-e338-858f-3714-bd42e1250924@foss.st.com>
Date: Thu, 12 Jan 2023 16:29:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, Olivier Moysan
 <olivier.moysan@foss.st.com>, <u-boot@lists.denx.de>
References: <20221215125058.1.I12616a161ad14b61957ff2da5357c1220bc0d77b@changeid>
 <89b9b76f-e881-1256-59f8-af2f9fabb98c@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <89b9b76f-e881-1256-59f8-af2f9fabb98c@foss.st.com>
X-Originating-IP: [10.201.21.26]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-12_08,2023-01-12_01,2022-06-22_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH] adc: stm32mp15: add calibration support
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

SGkgT0xpdmllcgoKT24gMS8zLzIzIDE4OjA4LCBQYXRyaWNrIERFTEFVTkFZIHdyb3RlOgo+IEhp
LAo+IAo+IE9uIDEyLzE1LzIyIDEzOjUxLCBPbGl2aWVyIE1veXNhbiB3cm90ZToKPj4gQWRkIHN1
cHBvcnQgb2Ygb2Zmc2V0IGFuZCBsaW5lYXIgY2FsaWJyYXRpb24gZm9yIFNUTTMyTVAxNS4KPj4g
VGhlIGNhbGlicmF0aW9uIGlzIHBlcmZvcm1lZCBvbmNlIGF0IHByb2JlLiBUaGUgQURDIGlzIHNl
dCBpbiBwb3dlciBvbgo+PiBzdGF0ZSBmb3IgY2FsaWJyYXRpb24uIEl0IHJlbWFpbnMgaW4gdGhp
cyBzdGF0ZSBhZnRlciBjYWxpYnJhdGlvbiwKPj4gdG8gZ2l2ZSB0byB0aGUga2VybmVsIHRoZSBv
cHBvcnR1bml0eSB0byByZXRyaWV2ZSBjYWxpYnJhdGlvbiBkYXRhLAo+PiBkaXJlY3RseSBmcm9t
IHRoZSBBREMuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IE9saXZpZXIgTW95c2FuIDxvbGl2aWVyLm1v
eXNhbkBmb3NzLnN0LmNvbT4KPj4gLS0tCj4+Cj4+IMKgIGRyaXZlcnMvYWRjL3N0bTMyLWFkYy5j
IHwgMTM0ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0KPj4gwqAgMSBm
aWxlIGNoYW5nZWQsIDExNiBpbnNlcnRpb25zKCspLCAxOCBkZWxldGlvbnMoLSkKPj4KPiAKPiAK
PiBSZXZpZXdlZC1ieTogUGF0cmljayBEZWxhdW5heSA8cGF0cmljay5kZWxhdW5heUBmb3NzLnN0
LmNvbT4KPiAKPiBUaGFua3MKPiBQYXRyaWNrCj4gCgpBcHBsaWVkIG9uIHUtYm9vdC1zdG0zMi9t
YXN0ZXIKClRoYW5rcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1h
bi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
