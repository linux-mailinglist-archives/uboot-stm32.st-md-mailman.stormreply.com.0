Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FFB43AC592
	for <lists+uboot-stm32@lfdr.de>; Fri, 18 Jun 2021 09:59:51 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CA078C597AF;
	Fri, 18 Jun 2021 07:59:50 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A3488C597AE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Jun 2021 07:59:48 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15I7vPVO016530; Fri, 18 Jun 2021 09:59:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : from : to
 : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=7ySAt54pxukAkiJbYBb/0TiXMqWZR1QJGxvWBxlBi6g=;
 b=e9fqB0ClGvxzKcisGsIrpN7bY+n0TPD7ifTuDV3YSoVK8Fj+6gd1BBFDp55h77LwwBPV
 pH6nl3ufIP4jZaHVjL4Jwz48hAykhVLk1iGXIIU8htMijuhfVRHtcZDfQj+xd+omzQHy
 2/PmbHzZxqjWwVSzrpciNnG07X1ckXQDbJ+O3W1Kyw2ybf6E7DZWJACmHp3lqA6jUFys
 40U2zrC6evdmJkjfLb3PuCHaYiZHnKvLWpLCktISSI48n3BQz8MBdE7WYx0XDqLhAASg
 88K8++Q0QiUvVrEo/KpcS45BzSGw/6mdp+ndjppCow27jGcCj3hM4AvkTgAAq9qJAWQ6 rw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3985b757ck-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Jun 2021 09:59:46 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A4F0C10002A;
 Fri, 18 Jun 2021 09:59:45 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9A31821A20A;
 Fri, 18 Jun 2021 09:59:45 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.49) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 18 Jun
 2021 09:59:44 +0200
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>, Marcin Sloniewski <marcin.sloniewski@gmail.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 <uboot-stm32@st-md-mailman.stormreply.com>
References: <cover.1622651232.git.gszymaszek@short.pl>
 <181587e59f14987c730d5a0c573407de1c59b511.1622651232.git.gszymaszek@short.pl>
 <b37cb3cb-e4d9-a659-f311-6ed6e99e043e@foss.st.com>
Message-ID: <480511ce-5b12-7caa-f51a-53c1c65333ae@foss.st.com>
Date: Fri, 18 Jun 2021 09:59:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <b37cb3cb-e4d9-a659-f311-6ed6e99e043e@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-17_17:2021-06-15,
 2021-06-17 signatures=0
Subject: Re: [Uboot-stm32] [PATCH v2 2/5] arm: dts: stm32mp157c-odyssey-som:
 enable all SDMMC2 data lanes
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

CgpPbiA2LzE4LzIxIDk6NTkgQU0sIFBhdHJpY2UgQ0hPVEFSRCB3cm90ZToKPiAKPiAKPiBPbiA2
LzIvMjEgNzowOSBQTSwgR3J6ZWdvcnogU3p5bWFzemVrIHdyb3RlOgo+PiBBZGQgdGhlIOKAnHNk
bW1jMl9kNDdfcGluc19k4oCdIHBpbnMgdG8gdGhlIFNETU1DMiBwaW5jdHJscy4gSW5jcmVhc2Ug
dGhlCj4+IGJ1cyB3aWR0aCBmcm9tIGZvdXIgdG8gZWlnaHQuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6
IEdyemVnb3J6IFN6eW1hc3playA8Z3N6eW1hc3pla0BzaG9ydC5wbD4KPj4gQ2M6IFBhdHJpY2Ug
Q2hvdGFyZCA8cGF0cmljZS5jaG90YXJkQGZvc3Muc3QuY29tPgo+PiBDYzogUGF0cmljayBEZWxh
dW5heSA8cGF0cmljay5kZWxhdW5heUBmb3NzLnN0LmNvbT4KPj4gUmV2aWV3ZWQtYnk6IFBhdHJp
Y2UgQ2hvdGFyZCA8cGF0cmljZS5jaG90YXJkQGZvc3Muc3QuY29tPgo+PiAtLS0KPj4gQ2hhbmdl
cyBmb3IgdjI6Cj4+ICAgIC0gcmViYXNlZCBvbiBjdXJyZW50IG1hc3RlciAocGF0Y2ggbm90IGNo
YW5nZWQpCj4+ICAgIC0gYWRkZWQgUGF0cmljZSBDaG90YXJk4oCZcyBSZXZpZXdlZC1ieQo+Pgo+
PiAgYXJjaC9hcm0vZHRzL3N0bTMybXAxNTdjLW9keXNzZXktc29tLmR0c2kgfCA4ICsrKystLS0t
Cj4+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+Pgo+
PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vZHRzL3N0bTMybXAxNTdjLW9keXNzZXktc29tLmR0c2kg
Yi9hcmNoL2FybS9kdHMvc3RtMzJtcDE1N2Mtb2R5c3NleS1zb20uZHRzaQo+PiBpbmRleCBlZDM5
OWMwMGQxLi43MzIzMzI1ZTYwIDEwMDY0NAo+PiAtLS0gYS9hcmNoL2FybS9kdHMvc3RtMzJtcDE1
N2Mtb2R5c3NleS1zb20uZHRzaQo+PiArKysgYi9hcmNoL2FybS9kdHMvc3RtMzJtcDE1N2Mtb2R5
c3NleS1zb20uZHRzaQo+PiBAQCAtMjY0LDE0ICsyNjQsMTQgQEAKPj4gIAo+PiAgJnNkbW1jMiB7
Cj4+ICAJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IiwgIm9wZW5kcmFpbiIsICJzbGVlcCI7Cj4+
IC0JcGluY3RybC0wID0gPCZzZG1tYzJfYjRfcGluc19hPjsKPj4gLQlwaW5jdHJsLTEgPSA8JnNk
bW1jMl9iNF9vZF9waW5zX2E+Owo+PiAtCXBpbmN0cmwtMiA9IDwmc2RtbWMyX2I0X3NsZWVwX3Bp
bnNfYT47Cj4+ICsJcGluY3RybC0wID0gPCZzZG1tYzJfYjRfcGluc19hICZzZG1tYzJfZDQ3X3Bp
bnNfZD47Cj4+ICsJcGluY3RybC0xID0gPCZzZG1tYzJfYjRfb2RfcGluc19hICZzZG1tYzJfZDQ3
X3BpbnNfZD47Cj4+ICsJcGluY3RybC0yID0gPCZzZG1tYzJfYjRfc2xlZXBfcGluc19hICZzZG1t
YzJfZDQ3X3NsZWVwX3BpbnNfZD47Cj4+ICAJbm9uLXJlbW92YWJsZTsKPj4gIAluby1zZDsKPj4g
IAluby1zZGlvOwo+PiAgCXN0LG5lZy1lZGdlOwo+PiAtCWJ1cy13aWR0aCA9IDw0PjsKPj4gKwli
dXMtd2lkdGggPSA8OD47Cj4+ICAJdm1tYy1zdXBwbHkgPSA8JnYzdjM+Owo+PiAgCXN0YXR1cyA9
ICJva2F5IjsKPj4gIH07Cj4+Cj4gQXBwbGllZCBvbiB1LWJvb3Qtc3RtMzIvbmV4dAo+IAo+IFRo
YW5rcwo+IApBcHBsaWVkIG9uIHUtYm9vdC1zdG0zMi9uZXh0CgpUaGFua3MKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBs
aXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
