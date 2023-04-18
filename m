Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A316E67BC
	for <lists+uboot-stm32@lfdr.de>; Tue, 18 Apr 2023 17:05:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 273BEC03FC3;
	Tue, 18 Apr 2023 15:05:25 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7DB26C01E98
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Apr 2023 15:05:23 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33IAp2Xr025300; Tue, 18 Apr 2023 17:05:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=C0J9AM++AkYs0V/hS2psUN6YsBdskuUxwRUx9QqOUsY=;
 b=d5A0drOIQ8SmllvTy+u3nyzuDlSaUfCsXCKqbdzvPHmrUpzdIt7jls1+AwKZeRexbrP/
 zM1B9uqD0JwvezYRvSgepKF9aID1P4k3qOOpxPlFMLfbqEvyel45wkbpuZP+wR2JUcOz
 R0yZJNbui7DMmzBgDLUUcdZVQ9gHSuzxSRm9gLjtT+T17axe+e+Vrp+krUgU5zDlBDHs
 xoRxsL0pdaL+fsHXlZxPFcqEAOYsb2tClImsxjRfHcP7eEX61RpetTHFouWkPMSabAZw
 BnUs2zLxc5mg3+JeRGZVn/nODPs1ZHAfo6U/g3mnP4G+kmuOkiKEY5I3/5rPzIq3ZNde Yw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3q1qf7axgy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Apr 2023 17:05:21 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EE70E10002A;
 Tue, 18 Apr 2023 17:05:20 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E1AFD22D179;
 Tue, 18 Apr 2023 17:05:20 +0200 (CEST)
Received: from [10.201.21.26] (10.201.21.26) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Tue, 18 Apr
 2023 17:05:20 +0200
Message-ID: <3f6f27fe-1248-9e03-e341-7dc43753066c@foss.st.com>
Date: Tue, 18 Apr 2023 17:05:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, Fabio Estevam <festevam@gmail.com>
References: <20230417185558.1.If7ed2ccb5a1c1a84637d29d763cc1935d9b8815e@changeid>
 <d3e391f5-ce85-e5f9-41e4-81e271db8deb@denx.de>
 <f1de64e5-a99c-1eb2-edf5-3f6bd492692e@foss.st.com>
 <CAOMZO5DywMdsqdVc_0gF7ADtgT7R2OCfVqW2nTjDMabFqy-SmA@mail.gmail.com>
 <208da22c-5cc6-d449-e691-18805ad734e2@denx.de>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <208da22c-5cc6-d449-e691-18805ad734e2@denx.de>
X-Originating-IP: [10.201.21.26]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-18_11,2023-04-18_01,2023-02-09_01
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH] usb: onboard-hub: Don't disable regulator
 in remove() callback
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

SGkgCgpPbiA0LzE4LzIzIDEzOjUzLCBNYXJlayBWYXN1dCB3cm90ZToKPiBPbiA0LzE4LzIzIDEz
OjQ5LCBGYWJpbyBFc3RldmFtIHdyb3RlOgo+PiBIaSBQYXRyaWNlIGFuZCBNYXJlaywKPj4KPj4g
T24gVHVlLCBBcHIgMTgsIDIwMjMgYXQgNDoyMuKAr0FNIFBhdHJpY2UgQ0hPVEFSRAo+PiA8cGF0
cmljZS5jaG90YXJkQGZvc3Muc3QuY29tPiB3cm90ZToKPj4KPj4+PiBJc24ndCB0aGUgcmVndWxh
dG9yIGVuYWJsZS9kaXNhYmxlIHJlZmNvdW50ZWQgPwo+Pj4KPj4+IFRoZXJlIGlzIG5vIHJlZmNv
dW50IG9uIHJlZ3VsYXRvciB0aGF0J3Mgd2h5IHdlIGxldCByZWd1bGF0b3IgZW5hYmxlLgo+Pgo+
PiBUaGVyZSBpcyBhIHJlY2VudCBwYXRjaCBmcm9tIEV1Z2VuIHRoYXQgYWRkcyByZWd1bGF0b3Ig
cmVmY291bnQgc3VwcG9ydDoKPj4KPj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvdS1ib290LzIw
MjMwMzMxMDkxNTQ5LjE0OTA5NS0xLWV1Z2VuLmhyaXN0ZXZAY29sbGFib3JhLmNvbS8KPiAKPiBU
aGF0J3MgbmljZSAhCgpQbGFuZXRzIGFyZSBwZXJmZWN0bHkgYWxpZ25lZCA7LSkKCkkgY2FuY2Vs
IHRoaXMgcGF0Y2gsIGFuZCB3aWxsIHRlc3QgdGhlIHBvaW50ZWQgc2VyaWVzIHdoZW4gaXQgd2ls
bCBiZSBtZXJnZWQuCgpUaGFua3MKUGF0cmljZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMy
QHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
