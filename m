Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 198498996A0
	for <lists+uboot-stm32@lfdr.de>; Fri,  5 Apr 2024 09:36:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A7952C6C83C;
	Fri,  5 Apr 2024 07:36:03 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7AAAEC6B46B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Apr 2024 07:36:02 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 4351XPb2008556; Fri, 5 Apr 2024 09:35:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=dIb9goX90fWEWjfY1nyXouDvCNvudroYANnHZFYCHho=; b=u5
 skZT2X1+cmJfDflq5AgZNxvyVU7AWyNFOBuMky/t0Ico0FNBpwKw2aCrtKaDvBBM
 Panu3JNgl8y9BimGjaNnTjb2coGz+mcEIeGHpH7ErY5BoczVhD6Gz+lBiZlNyFwg
 v++zUi7QAth7crbj91w/PCKDEk7jcfVTFJCZxcusq5geOjCWfRxIEedHb8Rxfgbz
 zFf+2JzTSnxWNcy2gb5JESaD0+pfgpxY0oBFZOvlZjqDvrxxZUNjHr1jQdxD/DSg
 hWJ3YoprEoJmiWsphShCIE0Um57bOSm7laWXTyB978d9vIGg4CvjXue1/jZ1ttFC
 aqsqlHTocUe5M+vv96SA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3x9empp1r6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Apr 2024 09:35:49 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 2384A40050;
 Fri,  5 Apr 2024 09:35:43 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 101A120F2AF;
 Fri,  5 Apr 2024 09:35:05 +0200 (CEST)
Received: from [10.252.29.225] (10.252.29.225) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 5 Apr
 2024 09:35:04 +0200
Message-ID: <0768ffcd-2e37-4a26-85a8-3d7b23ad5234@foss.st.com>
Date: Fri, 5 Apr 2024 09:35:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Fabio Estevam <festevam@gmail.com>, Marek Vasut <marex@denx.de>
References: <20240312211628.32842-1-marex@denx.de>
 <CAOMZO5BL0-1r63OiKLwgj1D2X1BHw4sN45g+QVeJ6vOSHrNFig@mail.gmail.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <CAOMZO5BL0-1r63OiKLwgj1D2X1BHw4sN45g+QVeJ6vOSHrNFig@mail.gmail.com>
X-Originating-IP: [10.252.29.225]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-05_06,2024-04-04_01,2023-05-22_02
Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Andreas Geisreiter <ageisreiter@dh-electronics.de>, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com,
 "NXP i.MX U-Boot Team" <uboot-imx@nxp.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, u-boot@dh-electronics.com,
 Stefano Babic <sbabic@denx.de>
Subject: Re: [Uboot-stm32] [PATCH] ARM: imx: stm32: Test whether ethernet
 node is enabled before reading MAC EEPROM on DHSOM
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

CgpPbiAzLzEzLzI0IDAxOjUyLCBGYWJpbyBFc3RldmFtIHdyb3RlOgo+IEhpIE1hcmVrLAo+IAo+
IE9uIFR1ZSwgTWFyIDEyLCAyMDI0IGF0IDY6MTbigK9QTSBNYXJlayBWYXN1dCA8bWFyZXhAZGVu
eC5kZT4gd3JvdGU6Cj4gCj4+IE5PVEU6IEl0IGlzIHByb2JhYmx5IGJlc3QgaWYgdGhpcyBnb2Vz
IGluIHZpYSBlaXRoZXIgaW14IG9yIHN0bTMyIHRyZWUsCj4+ICAgICAgIEkgY2FuIGJyZWFrIHRo
ZSBwYXRjaCB1cCwgYnV0IHRoYXQgd291bGQgaW50cm9kdWNlIGRlcGVuZGVuY3kKPj4gICAgICAg
YmV0d2VlbiB0d28gUFJzIGluIGRpZmZlcmVudCB0cmVlcy4gTGV0IG1lIGtub3cgd2hhdCB5b3Ug
cHJlZmVyLgo+IAoKSGkgTWFyZWssIEZhYmlvCgpTb3JyeSBmb3IgdGhlIGRlbGF5LgoKPiBJIGNh
biBhcHBseSBpdCB0byB1LWJvb3QtaW14IG5leHQgaWYgUGF0cmljZSBhbmQgUGF0cmljayBhcmUg
T0suCgp5ZXMsIHlvdSBjYW4gYXBwbHkgaXQgZGlyZWN0bHkgdGhyb3VnaCB1LWJvb3QtaW14IG5l
eHQuCgpUaGFua3MKUGF0cmljZQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20v
bWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
